import 'package:flutter/material.dart';
import 'package:flutter_uis/UI.dart';
import 'package:flutter_uis/Utils.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';

import '../../data/data.dart' as data;

import 'package:flutter_uis/Widgets/Screen/Screen.dart';
import 'Widgets/Content.dart';

import 'Dimensions.dart';

class ASCHomeScreen extends StatefulWidget {
  @override
  _ASCHomeScreenState createState() => _ASCHomeScreenState();
}

class _ASCHomeScreenState extends State<ASCHomeScreen> {
  PageController pageController = PageController();
  double offset = 0.0;
  int activePage = 0;

  @override
  void initState() {
    this.pageController.addListener(() {
      setState(() {
        this.offset = this.pageController.offset;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext buildCtx) {
    return RawKeyboardListener(
      autofocus: true,
      focusNode: FocusNode(),
      onKey: (event) {
        final key = event.logicalKey.debugName;
        final rightKeys = ['Key K', 'Arrow Right'];
        final leftKeys = ['Key I', 'Arrow Left'];
        final duration =
            (AppDimensions.size.width * 0.5).clamp(500.0, 800.0).toInt();

        print("duration $duration");

        if (event.runtimeType.toString() == 'RawKeyUpEvent') {
          if (rightKeys.contains(key) && activePage < data.list.length - 1) {
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
      child: NotificationListener<SizeChangedLayoutNotification>(
        onNotification: (SizeChangedLayoutNotification notification) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            setState(() {
              this.offset = this.pageController.offset;
            });
          });
          return false;
        },
        child: SizeChangedLayoutNotifier(
          child: Screen(
            Dimensions.init,
            scaffoldBackgroundColor: Colors.white,
            builder: (_) => PageView.builder(
              physics: ClampingScrollPhysics(),
              controller: this.pageController,
              onPageChanged: (index) => setState(() => this.activePage = index),
              itemCount: data.list.length,
              itemBuilder: (itemCtx, index) {
                final item = data.list[index];
                double ratio = this.offset - (AppDimensions.size.width * index);

                double uiRatio = ratio / 100;

                if (uiRatio < 0) {
                  uiRatio *= -1.0;
                }

                if (UI.xmd) {
                  uiRatio *= 0.65;
                }
                if (UI.lg) {
                  uiRatio *= 0.7;
                }
                if (UI.xlg) {
                  uiRatio *= 0.8;
                }

                return Container(
                  width: AppDimensions.size.width,
                  height: AppDimensions.size.height,
                  child: SingleChildScrollView(
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            this.buildHeader(item, ratio),
                            Content(item, ratio, uiRatio),
                          ],
                        ),
                        this.buildShoe(item, ratio, uiRatio),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHeader(data.ASCItem item, double ratio) {
    return Container(
      alignment: Alignment.topCenter,
      height: Dimensions.headerHeight,
      padding: EdgeInsets.all(AppDimensions.padding * 2),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [item.colors[0], item.colors[1], item.colors[2]]
              .reversed
              .toList(),
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          // stops: [0.0, 0.3, 0.7, 1.0],
        ),
      ),
      child: Container(
        width: AppDimensions.maxContainerWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Utils.safePadding(context, "top"),
            Container(height: AppDimensions.padding * 2),
            Container(
              height: Dimensions.logoHeight,
              child: Image.asset(item.logoLink),
            ),
            Container(height: AppDimensions.padding * 2),
            Container(
              margin: EdgeInsets.all(AppDimensions.padding * 2),
              transform: Matrix4.identity()..translate(ratio * -0.9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.headerHeading,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 12 + AppDimensions.ratio * 6,
                    ),
                  ),
                  Container(height: AppDimensions.padding * 1),
                  Text(
                    item.headerDescription,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 7 + AppDimensions.ratio * 4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildShoe(data.ASCItem item, double ratio, double uiRatio) {
    double width = Dimensions.shoeWidth;
    double height = Dimensions.shoeHeight;

    final scale = uiRatio * -0.12;
    final opacity = uiRatio * 0.15;

    return Positioned(
      top: Dimensions.shoeTop,
      // left: (AppDimensions.size.width / 2) - width * 0.4,
      left: (AppDimensions.size.width / 2) - width * 0.45,
      child: Transform(
        transform: Matrix4.identity()
          ..rotateZ((24 + (uiRatio * 15)) * 3.1415927 / 180)
          ..scale(1 + scale, 1 + scale)
          ..translate(uiRatio * -35),
        origin: Offset(width / 2, height / 2),
        child: Opacity(
          opacity: (1 - opacity).clamp(0.0, 1.0),
          child: Container(
            width: width,
            height: height,
            // color: Colors.red,
            alignment: Alignment.center,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Positioned(
                  bottom: Dimensions.shoeHeight * 0.08,
                  // bottom: AppDimensions.ratio * 12,
                  left: AppDimensions.ratio * 10,
                  right: AppDimensions.ratio * 10,
                  child: Container(
                    height: AppDimensions.ratio * 1,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 30,
                          spreadRadius: 16,
                          color: Colors.black.withOpacity(0.55),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Image.asset(item.shoeImage),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
