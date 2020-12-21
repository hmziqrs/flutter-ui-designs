import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/Utils.dart';
import 'package:flutter_uis/UI.dart';

import 'package:flutter_uis/widgets/Screen/Screen.dart';

import '../../configs/theme.dart' as theme;
import '../../data/data.dart' as data;
import 'Dimensions.dart';
import 'TestKeys.dart';

import 'widgets/SKVDetailScreenSpaceBackground.dart';
import 'widgets/SKVDetailScreenTextContent.dart';
import 'widgets/SKVDetailScreenPlanet.dart';
import 'widgets/SKVDetailScreenOrbit.dart';

class SKVDetailScreen extends StatefulWidget {
  final int index;
  SKVDetailScreen(this.index, {Key key}) : super(key: key);

  _SKVDetailScreenState createState() => _SKVDetailScreenState();
}

class _SKVDetailScreenState extends State<SKVDetailScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  PageController pageController;
  ScrollController starsController;

  bool pageRendered = false;
  int activePage;
  Timer timeout;
  GlobalKey starsWidgetKey = GlobalKey();

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
      final starsWidget = this.starsWidgetKey.currentContext;

      if (starsWidget != null) {
        final starsOffset = starsWidget.size.width - screenWidth;
        this.starsController.jumpTo(
              Utils.rangeMap(
                offset,
                0,
                totalScroll,
                0,
                starsOffset,
              ),
            );
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

  void onKeyHandler(event) {
    final duration =
        (AppDimensions.size.width * 0.5).clamp(500.0, 800.0).toInt();

    if (event.runtimeType == RawKeyDownEvent) {
      return;
    }

    if (event.logicalKey == LogicalKeyboardKey.arrowRight &&
        activePage < data.objectList.length - 1) {
      this.pageController.animateToPage(
            this.activePage + 1,
            duration: Duration(milliseconds: duration),
            curve: Curves.linear,
          );
    }
    if (event.logicalKey == LogicalKeyboardKey.arrowLeft && activePage > 0) {
      this.pageController.animateToPage(
            this.activePage - 1,
            duration: Duration(milliseconds: duration),
            curve: Curves.linear,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    UI.init(context);
    Dimensions.init(context);

    final fontStyle = Theme.of(context).textTheme.bodyText1.copyWith(
          fontFamily: 'Montserrat',
        );

    final rootTheme = Theme.of(context).copyWith(
      primaryColor: theme.secondary,
      accentColor: theme.secondary,
    );

    return Screen(
      theme: rootTheme,
      textStyle: fontStyle,
      fontFamily: 'Montserrat',
      child: RawKeyboardListener(
        autofocus: true,
        focusNode: FocusNode(),
        onKey: this.onKeyHandler,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SKVDetailScreenSpaceBackground(
              pageRendered: this.pageRendered,
              starsWidgetKey: this.starsWidgetKey,
              starsController: this.starsController,
            ),
            Positioned.fill(
              child: PageView.builder(
                key: Key(SKVDetailScreenTestKeys.rootScroll),
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
                  data.SKVObject item = data.objectList[index];
                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      SKVDetailScreenOrbit(
                        index: index,
                        pageRendered: pageRendered,
                        offset: this.pageController.offset,
                      ),
                      SKVDetailScreenPlanet(
                        item: item,
                        index: index,
                        pageRendered: pageRendered,
                        offset: this.pageController.offset,
                      ),
                      SKVDetailScreenTextContent(
                        item: item,
                        pageRendered: this.pageRendered,
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
