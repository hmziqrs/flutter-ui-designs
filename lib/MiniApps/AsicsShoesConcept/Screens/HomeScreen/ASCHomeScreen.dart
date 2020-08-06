import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/UI.dart';

import 'package:flutter_uis/Widgets/Screen/Screen.dart';
import 'package:flutter_uis/Mixins/HoverWidget.dart';

import '../../data/data.dart' as data;
import 'Dimensions.dart';
import 'TestKeys.dart';

import 'widgets/ASCHomeScreenContent.dart';
import 'widgets/ASCHomeScreenHeader.dart';
import 'widgets/ASCHomeScreenShoe.dart';

class ASCHomeScreen extends StatefulWidget {
  @override
  _ASCHomeScreenState createState() => _ASCHomeScreenState();
}

class _ASCHomeScreenState extends State<ASCHomeScreen>
    with AnimationControllerMixin {
  PageController pageController = PageController();
  Animation<Color> activeColor;
  int activeColorIndex = 0;
  double offset = 0.0;
  int activePage = 0;

  @override
  void initState() {
    final color = data.list[activePage].colors[0];

    this.activeColor = ColorTween(
      begin: color,
      end: color,
    ).animate(this.controller);

    this.pageController.addListener(() {
      setState(() {
        this.offset = this.pageController.offset;
      });
    });

    super.initState();
  }

  void changeColor(Color color, int index) {
    setState(() {
      this.activeColorIndex = index;
    });
    this.activeColor = ColorTween(
      begin: this.activeColor.value,
      end: color,
    ).animate(this.controller);
    this.controller.reset([
      FromToTask(
        to: 0.0,
        duration: Duration(milliseconds: 0),
      ),
      FromToTask(
        to: 1.0,
        duration: Duration(milliseconds: 280),
      ),
    ]);
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
            theme: Theme.of(context).copyWith(
              accentColor: this.activeColor.value,
              primaryColor: this.activeColor.value,
            ),
            builder: (_) => PageView.builder(
              physics: ClampingScrollPhysics(),
              controller: this.pageController,
              key: Key(ASCHomeScreenTestKeys.rootScroll),
              onPageChanged: (index) => setState(() {
                this.activePage = index;
                final color = data.list[index].colors[0];

                this.activeColor = ColorTween(
                  begin: color,
                  end: color,
                ).animate(this.controller);
              }),
              itemCount: data.list.length,
              itemBuilder: (itemCtx, index) {
                final item = data.list[index];
                double parallax =
                    this.offset - (AppDimensions.size.width * index);

                double uiParallax = parallax / 100;

                if (uiParallax < 0) {
                  uiParallax *= -1.0;
                }

                if (UI.xmd) {
                  uiParallax *= 0.65;
                }
                if (UI.lg) {
                  uiParallax *= 0.7;
                }
                if (UI.xlg) {
                  uiParallax *= 0.8;
                }

                return Container(
                  width: AppDimensions.size.width,
                  height: AppDimensions.size.height,
                  child: SingleChildScrollView(
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            ASCHomeScreenHeader(item: item, parallax: parallax),
                            ASCHomeScreenContent(
                              item: item,
                              uiParallax: uiParallax,
                              activePage: this.activePage,
                              changeColor: this.changeColor,
                              activeColor: this.activeColor.value,
                              activeColorIndex: this.activeColorIndex,
                            ),
                          ],
                        ),
                        ASCHomeScreenShoe(item: item, uiParallax: uiParallax),
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
}
