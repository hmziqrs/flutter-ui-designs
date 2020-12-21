import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_uis/configs/AppTheme.dart';

import 'package:flutter_uis/Utils.dart';
import 'package:flutter_uis/UI.dart';

import 'package:flutter_uis/widgets/BackButton4Stack/BackButton4Stack.dart';
import 'package:flutter_uis/widgets/Screen/Screen.dart';

import 'widgets/HABDetailScreenFlightHeader.dart';
import 'widgets/HABDetailScreenFlightView.dart';

import '../../data/flights.dart' as data;

import 'Dimensions.dart';
import 'TestKeys.dart';

class HABDetailScreen extends StatefulWidget {
  HABDetailScreen(this.index, {Key key}) : super(key: key);
  final int index;

  _HABDetailScreenState createState() => _HABDetailScreenState();
}

class _HABDetailScreenState extends State<HABDetailScreen> {
  PageController pageController;
  ScrollController backgroundController;
  int activePage;
  bool rendered = false;

  @override
  void initState() {
    this.activePage = widget.index;
    this.backgroundController = ScrollController();
    this.pageController = PageController(
      initialPage: widget.index,
      keepPage: true,
    );

    this.pageController.addListener(() {
      this.syncParallaxBackground();
      setState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      this.syncParallaxBackground();
      setState(() {
        this.rendered = true;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    this.pageController.dispose();
    super.dispose();
  }

  void setActivePage(int index) {
    setState(() {
      this.activePage = index;
    });
  }

  void syncParallaxBackground() {
    int listSize = data.flights.length - 1;

    final offset = this.pageController.offset;
    final totalSize = UI.width * (listSize);
    this.backgroundController.jumpTo(
          Utils.rangeMap(
            offset,
            0.0,
            totalSize,
            0.0,
            this.backgroundController.position.maxScrollExtent,
          ),
        );
  }

  void onKeyHandler(RawKeyEvent event) {
    if (event.runtimeType == RawKeyDownEvent) {
      return;
    }

    if (event.logicalKey == LogicalKeyboardKey.arrowRight &&
        activePage < data.flights.length - 1) {
      this.pageController.animateToPage(
            this.activePage + 1,
            duration: Duration(milliseconds: 280),
            curve: Curves.easeIn,
          );
    }
    if (event.logicalKey == LogicalKeyboardKey.arrowLeft && activePage > 0) {
      this.pageController.animateToPage(
            this.activePage - 1,
            duration: Duration(milliseconds: 280),
            curve: Curves.easeIn,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);

    final fontStyle = Theme.of(context).textTheme.bodyText1.copyWith(
          fontFamily: 'Montserrat',
        );
    final rootTheme = Theme.of(context).copyWith(
      primaryColor: AppTheme.primary,
      accentColor: AppTheme.primary,
    );

    return RawKeyboardListener(
      autofocus: true,
      focusNode: FocusNode(),
      onKey: this.onKeyHandler,
      child: Screen(
        theme: rootTheme,
        textStyle: fontStyle,
        fontFamily: 'Montserrat',
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Parallax Image Background
            Positioned.fill(
              bottom: null,
              child: Container(
                height: Dimensions.backgroundImageHeight,
                foregroundDecoration: BoxDecoration(
                  color: AppTheme.background.withOpacity(0.44),
                  // color: theme.background2.withOpacity(0.8),
                ),
                child: ListView.builder(
                  itemCount: Dimensions.noOfImages,
                  scrollDirection: Axis.horizontal,
                  controller: this.backgroundController,
                  itemBuilder: (_, i) => Image.asset(
                    "assets/ma-hab/mountains.jpg",
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            // Header
            HABDetailScreenFlightHeader(
              activePage: this.activePage,
              pageViewOffset: this.rendered ? this.pageController?.offset : 0.0,
            ),
            // Horizontal PageView Builder
            PageView.builder(
              pageSnapping: true,
              controller: this.pageController,
              itemCount: data.flights.length,
              scrollDirection: Axis.horizontal,
              onPageChanged: this.setActivePage,
              key: Key(HABDetailScreenTestKeys.rootPageView),
              itemBuilder: (context, index) {
                final flight = data.flights[index];
                return HABDetailScreenFlightView(flight, fontStyle);
              },
            ),
            // Back Button 4 Stack
            BackButton4Stack(),
          ],
        ),
      ),
    );
  }
}
