import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uis/Widgets/Screen/Screen.dart';
import 'package:flutter_uis/configs/AppDimensions.dart';

import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:simple_animations/simple_animations.dart';

import 'package:flutter_uis/Utils.dart';
import 'package:flutter_uis/UI.dart';

import '../../configs/theme.dart' as theme;
import '../../data/data.dart' as data;
import 'Widgets/Planet.dart';
import 'Widgets/Orbit.dart';
import 'Dimensions.dart';

class SKDetailScreen extends StatefulWidget {
  final int index;
  SKDetailScreen(this.index, {Key key}) : super(key: key);

  _SKDetailScreenState createState() => _SKDetailScreenState();
}

class _SKDetailScreenState extends State<SKDetailScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  PageController pageController;
  ScrollController starsController;
  bool pageRendered = false;
  int activePage;
  Timer timeout;
  GlobalKey starsKey = GlobalKey();

  void initState() {
    super.initState();
    this.activePage = widget.index;
    this.pageController = new PageController(
      initialPage: widget.index,
      keepPage: true,
    );
    this.starsController = new ScrollController();
    this.pageController.addListener(() {
      final offset = this.pageController.offset;
      final screenWidth = AppDimensions.size.width;

      final totalScroll = (data.objectList.length - 1) * screenWidth;

      final starsWidget = this.starsKey.currentContext;

      if (starsWidget != null) {
        final starsOffset = starsWidget.size.width - screenWidth;
        this
            .starsController
            .jumpTo(Utils.rangeMap(offset, 0, totalScroll, 0, starsOffset));

        setState(() {});
      }
    });

    Utils.lightStatusBar();

    this.timeout = Timer(
      Duration(milliseconds: 1300),
      () => setState(() {
        this.pageRendered = true;
      }),
    );
  }

  @override
  void dispose() {
    Utils.darkStatusBar();
    this.pageController.dispose();
    this.timeout.cancel();
    super.dispose();
  }

  attribute(String label, String prefix, String text, IconData icon) {
    return Container(
      margin: EdgeInsets.only(
        left: AppDimensions.padding * 2,
        bottom: AppDimensions.padding,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              right: AppDimensions.padding,
            ),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0),
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 10.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 20,
                  color: theme.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    UI.init(context);
    Dimensions.init(context);

    final fontStyle = Theme.of(context).textTheme.body1.copyWith(
          fontFamily: 'Montserrat',
        );

    final rootTheme = Theme.of(context).copyWith(
      primaryColor: theme.secondary,
      accentColor: theme.secondary,
    );

    return Screen(
      Dimensions.init,
      textStyle: fontStyle,
      theme: rootTheme,
      builder: (_) {
        return RawKeyboardListener(
          autofocus: true,
          focusNode: FocusNode(),
          onKey: (event) {
            final key = event.logicalKey.debugName;
            final rightKeys = ['Key K', 'Arrow Right'];
            final leftKeys = ['Key I', 'Arrow Left'];
            final duration =
                (AppDimensions.size.width * 0.5).clamp(500.0, 800.0).toInt();

            if (event.runtimeType.toString() == 'RawKeyUpEvent') {
              if (rightKeys.contains(key) &&
                  activePage < data.objectList.length - 1) {
                this.pageController.animateToPage(
                      this.activePage + 1,
                      duration: Duration(milliseconds: duration),
                      curve: Curves.linear,
                    );
              } else if (leftKeys.contains(key) && activePage > 0) {
                this.pageController.animateToPage(
                      this.activePage - 1,
                      duration: Duration(milliseconds: duration),
                      curve: Curves.linear,
                    );
              }
            }
          },
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              this.buildSpaceBackground(Orientation.portrait),
              Positioned.fill(
                child: PageView.builder(
                  controller: this.pageController,
                  itemCount: data.objectList.length,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index) =>
                      setState(() => (this.activePage = index)),
                  pageSnapping: true,
                  physics: this.pageRendered
                      ? new ClampingScrollPhysics()
                      : new NeverScrollableScrollPhysics(),
                  itemBuilder: (ctx, index) {
                    data.SpaceObject item = data.objectList[index];
                    return Stack(
                      fit: StackFit.expand,
                      children: [
                        Orbit(pageRendered, index, this.pageController.offset),
                        Planet(
                          item,
                          pageRendered,
                          index,
                          this.pageController.offset,
                        ),
                        this.buildTextContent(item),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget buildSpaceBackground(Orientation orientation) {
    final tween = Tween(begin: 0.0, end: 0.45);
    return Positioned.fill(
      top: Dimensions.starBgTopSpace,
      bottom: Dimensions.starBgBottomSpace,
      child: ControlledAnimation(
        duration: Duration(milliseconds: 1200),
        tween: tween,
        builder: (ctx, animation) => Container(
          foregroundDecoration: BoxDecoration(
            color: Colors.black.withOpacity(
              this.pageRendered ? tween.end : animation,
            ),
          ),
          child: SingleChildScrollView(
            controller: this.starsController,
            scrollDirection: Axis.horizontal,
            physics: NeverScrollableScrollPhysics(),
            child: Row(
              key: this.starsKey,
              children: List.generate(
                data.objectList.length + 1,
                (index) => Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateX(0.0)
                    ..rotateY(index % 2 == 1 ? 0.0 : math.pi),
                  alignment: FractionalOffset.center,
                  child: Image.asset(
                    "assets/ma-sk/stars-bg.jpg",
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAnimatiedText({Widget child, int index}) {
    int initialDelay = (this.pageRendered ? 400 : 900) + (index * 60);
    return ControlledAnimation(
      delay: Duration(milliseconds: initialDelay),
      duration: Duration(milliseconds: 550),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (ctx, animation) => Opacity(
        opacity: animation,
        child: child,
      ),
    );
  }

  Widget buildTextContent(data.SpaceObject item) {
    return Positioned.fill(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: AppDimensions.padding * 2,
                left: AppDimensions.padding * 2,
              ),
              child: this.buildAnimatiedText(
                index: 0,
                child: Text(
                  item.name,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: AppDimensions.padding * 2),
              child: this.buildAnimatiedText(
                index: 1,
                child: Text(
                  item.nickname,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: AppDimensions.padding * 2),
              child: this.buildAnimatiedText(
                index: 2,
                child: Text(
                  item.distanceInKm,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: theme.primary,
                  ),
                ),
              ),
            ),
            this.buildAnimatiedText(
              index: 3,
              child: Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(
                  left: AppDimensions.padding * 2,
                  top: AppDimensions.padding,
                ),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(),
            ),
            this.buildAnimatiedText(
              index: 4,
              child: this.attribute(
                "DISTANCE FROM THE SUN",
                "km",
                item.distanceFromSun,
                MaterialCommunityIcons.arrow_expand,
              ),
            ),
            this.buildAnimatiedText(
              index: 5,
              child: this.attribute(
                "ONE WAY LIGHT TIME TO THE SUN",
                "min",
                item.lightTimeFromSun,
                MaterialCommunityIcons.weather_sunny,
              ),
            ),
            this.buildAnimatiedText(
              index: 6,
              child: this.attribute(
                "LENGTH OF YEAR",
                "Earth Days",
                item.lengthOfYears,
                MaterialCommunityIcons.moon_waning_crescent,
              ),
            ),
            Container(height: AppDimensions.padding * 1),
          ],
        ),
      ),
    );
  }
}
