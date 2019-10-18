import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:simple_animations/simple_animations.dart';

import 'package:flutter_uis/Utils.dart';
import 'package:flutter_uis/UI.dart';

import '../../configs/theme.dart' as theme;
import '../../data/data.dart' as data;
import 'Widgets/Planet.dart';
import 'Widgets/Orbit.dart';
import 'Dimensions.dart';

class SKDetailScreen extends CupertinoPageRoute {
  int index;

  SKDetailScreen(int index)
      : this.index = index,
        super(builder: (BuildContext ctx) => SKDetailScreenContent(index));

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: animation,
      child: new SKDetailScreenContent(this.index),
    );
  }
}

class SKDetailScreenContent extends StatefulWidget {
  SKDetailScreenContent(this.index, {Key key}) : super(key: key);
  final int index;

  _SKDetailScreenContentState createState() => _SKDetailScreenContentState();
}

class _SKDetailScreenContentState extends State<SKDetailScreenContent>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  PageController pageController;
  ScrollController starsController;
  bool pageRendered = false;
  Timer timeout;
  double backgroundAlign = -1.0;
  GlobalKey starsKey = GlobalKey();

  void initState() {
    super.initState();
    this.pageController = new PageController(
      initialPage: widget.index,
      keepPage: true,
    );
    this.starsController = new ScrollController();
    this.pageController.addListener(() {
      final offset = this.pageController.offset;
      final screenWidth = Dimensions.getSize().width;

      final totalScroll = (data.objectList.length - 1) * screenWidth;

      final starsWidget = this.starsKey.currentContext;
      if (starsWidget != null) {
        final stars = starsWidget.size.width - screenWidth;
        this
            .starsController
            .jumpTo(Utils.rangeMap(offset, 0, totalScroll, 0, stars));

        setState(() {});
      }
    });

    Utils.lightStatusBar();

    this.timeout = Timer(
      Duration(milliseconds: 1300),
      () => setState(
        () {
          this.pageRendered = true;
        },
      ),
    );
  }

  @override
  void dispose() {
    Utils.darkStatusBar();
    this.pageController.dispose();
    this.timeout.cancel();
    super.dispose();
  }

  starsBackground(Orientation orientation) {
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
                data.objectList.length,
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

  renderText({Widget child, int index}) {
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

  attribute(String label, String prefix, String text, IconData icon) {
    return Container(
      margin: EdgeInsets.only(
          left: Dimensions.padding * 2, bottom: Dimensions.padding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: Dimensions.padding),
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

    return Scaffold(
      body: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: theme.secondary,
          accentColor: theme.secondary,
          // textTheme: TextTheme(body1: Theme.of(context).textTheme.body1),
        ),
        child: DefaultTextStyle(
          style: fontStyle,
          child: OrientationBuilder(
            builder: (BuildContext context, Orientation orientation) {
              UI.init(context);
              Dimensions.init(context, orientation: orientation);

              return Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  this.starsBackground(orientation),
                  Positioned.fill(
                    child: PageView.builder(
                      controller: this.pageController,
                      itemCount: data.objectList.length,
                      scrollDirection: Axis.horizontal,
                      pageSnapping: true,
                      physics: this.pageRendered
                          ? new AlwaysScrollableScrollPhysics()
                          : new NeverScrollableScrollPhysics(),
                      itemBuilder: (ctx, index) {
                        data.SpaceObject item = data.objectList[index];
                        return Stack(
                          fit: StackFit.expand,
                          children: [
                            Orbit(pageRendered, index,
                                this.pageController.offset),
                            Planet(
                              item,
                              pageRendered,
                              index,
                              this.pageController.offset,
                            ),
                            Positioned.fill(
                              child: SafeArea(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: Dimensions.padding * 2,
                                        left: Dimensions.padding * 2,
                                      ),
                                      child: this.renderText(
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
                                      padding: EdgeInsets.only(
                                          left: Dimensions.padding * 2),
                                      child: this.renderText(
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
                                      padding: EdgeInsets.only(
                                          left: Dimensions.padding * 2),
                                      child: this.renderText(
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
                                    this.renderText(
                                      index: 3,
                                      child: Container(
                                        alignment: Alignment.topLeft,
                                        margin: EdgeInsets.only(
                                          left: Dimensions.padding * 2,
                                          top: Dimensions.padding,
                                        ),
                                        child: GestureDetector(
                                          onTap: () =>
                                              Navigator.of(context).pop(),
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
                                    this.renderText(
                                      index: 4,
                                      child: this.attribute(
                                        "DISTANCE FROM THE SUN",
                                        "km",
                                        item.distanceFromSun,
                                        MaterialCommunityIcons.arrow_expand,
                                      ),
                                    ),
                                    this.renderText(
                                      index: 5,
                                      child: this.attribute(
                                        "ONE WAY LIGHT TIME TO THE SUN",
                                        "min",
                                        item.lightTimeFromSun,
                                        MaterialCommunityIcons.weather_sunny,
                                      ),
                                    ),
                                    this.renderText(
                                      index: 6,
                                      child: this.attribute(
                                        "LENGTH OF YEAR",
                                        "Earth Days",
                                        item.lengthOfYears,
                                        MaterialCommunityIcons
                                            .moon_waning_crescent,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
