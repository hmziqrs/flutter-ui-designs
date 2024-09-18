import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:supercharged/supercharged.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/UI.dart';

import 'package:flutter_uis/widgets/Screen/Screen.dart';
import 'package:flutter_uis/Mixins/HoverWidget.dart';

import '../../data/data.dart' as data;
import 'Dimensions.dart';
import 'Provider.dart';
import 'TestKeys.dart';

import 'widgets/ASCHomeScreenContent.dart';
import 'widgets/ASCHomeScreenHeader.dart';
import 'widgets/ASCHomeScreenShoe.dart';

class ASCHomeScreen extends StatefulWidget {
  @override
  _ASCHomeScreenState createState() => _ASCHomeScreenState();
}

class _ASCHomeScreenState extends State<ASCHomeScreen> with AnimationMixin {
  PageController pageController = PageController();
  late Animation<Color?> activeColor;
  int activeColorIndex = 0;
  double offset = 0.0;
  int activePage = 0;

  @override
  void initState() {
    final color = data.list[activePage].colors[0];
    this.controller.duration = 280.milliseconds;
    this.activeColor = color.tweenTo(color).animate(this.controller);

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
    this.controller.duration = 280.milliseconds;
    this.controller.forward(from: 0.0);
  }

  void onKeyHandler(KeyEvent event) {
    final duration =
        (AppDimensions.size.width * 0.5).clamp(500.0, 800.0).toInt();

    if (event.runtimeType == KeyDownEvent) {
      return;
    }
    if (event.logicalKey == LogicalKeyboardKey.arrowRight &&
        this.activePage < data.list.length - 1) {
      this.pageController.animateToPage(
            this.activePage + 1,
            duration: Duration(milliseconds: duration),
            curve: Curves.linear,
          );
    }
    if (event.logicalKey == LogicalKeyboardKey.arrowLeft &&
        this.activePage > 0) {
      this.pageController.animateToPage(
            this.activePage - 1,
            duration: Duration(milliseconds: duration),
            curve: Curves.linear,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);

    return KeyboardListener(
      autofocus: true,
      focusNode: FocusNode(),
      onKeyEvent: this.onKeyHandler,
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
            theme: Theme.of(context).copyWith(
              primaryColor: this.activeColor.value,
              colorScheme: ColorScheme.fromSwatch()
                  .copyWith(secondary: this.activeColor.value),
            ),
            child: PageView.builder(
              physics: ClampingScrollPhysics(),
              controller: this.pageController,
              key: Key(ASCHomeScreenTestKeys.rootScroll),
              onPageChanged: (index) {
                this.changeColor(data.list[index].colors[0], 0);
              },
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

                return ChangeNotifierProvider<ASCShoeProvider>(
                  create: (_) => ASCShoeProvider(),
                  child: Container(
                    width: AppDimensions.size.width,
                    height: AppDimensions.size.height,
                    child: SingleChildScrollView(
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              ASCHomeScreenHeader(
                                item: item,
                                parallax: parallax,
                                colorIndex: activeColorIndex,
                              ),
                              ASCHomeScreenContent(
                                item: item,
                                uiParallax: uiParallax,
                                activePage: this.activePage,
                                changeColor: this.changeColor,
                                activeColor: this.activeColor.value!,
                                activeColorIndex: this.activeColorIndex,
                              ),
                            ],
                          ),
                          ASCHomeScreenShoe(item: item, uiParallax: uiParallax),
                        ],
                      ),
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
