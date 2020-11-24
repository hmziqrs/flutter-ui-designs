import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/App.dart';
import 'package:flutter_uis/Utils.dart';

import '../../../models/ASCItem.dart';
import '../messages/keys.dart';
import '../Dimensions.dart';
import '../TestKeys.dart';

class ASCHomeScreenContentColorFilters extends StatelessWidget {
  ASCHomeScreenContentColorFilters({
    @required this.item,
    @required this.uiParallax,
    @required this.activePage,
    @required this.activeColor,
    @required this.changeColor,
    @required this.activeColorIndex,
  });

  final ASCItem item;
  final int activePage;
  final double uiParallax;
  final Color activeColor;
  final int activeColorIndex;
  final Function(Color color, int index) changeColor;

  @override
  Widget build(BuildContext context) {
    final translate = this.uiParallax * 8;
    final opacity = this.uiParallax * 0.14;
    return Opacity(
      opacity: (1.0 - opacity).clamp(0.0, 1.0),
      child: Container(
        key: Key(ASCHomeScreenTestKeys.colorsBase),
        transform: Matrix4.identity()..translate(translate, translate),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              App.translate(
                ASCHomeScreenMessages.colours,
                context,
              ),
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 8 + AppDimensions.ratio * 6,
              ),
            ),
            Container(height: AppDimensions.padding * 1),
            Row(
              children: this.item.colors.map(
                (color) {
                  final index = this.item.colors.indexOf(color);
                  final offset = Dimensions.colorRadius / 2;
                  // final key = ASCHomeScreenTestKeys.color +
                  //     "${this.activePage}-${index + 1}";

                  return GestureDetector(
                    key: Key(
                      ASCHomeScreenTestKeys.getColor(
                        this.activePage,
                        index + 1,
                      ),
                    ),
                    onTap: () => this.changeColor(color, index),
                    child: CustomAnimation(
                      tween: Tween(begin: 0.0, end: 1.0),
                      duration: Duration(milliseconds: 180),
                      control: this.activeColorIndex == index
                          ? CustomAnimationControl.PLAY
                          : CustomAnimationControl.PLAY_REVERSE,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: this.activeColor,
                            width: AppDimensions.ratio * 1,
                          ),
                        ),
                      ),
                      builder: (context, child, animation) {
                        final innerCircleRadius = Dimensions.colorRadius *
                            Utils.rangeMap(animation, 0.0, 1.0, 0.55, 0.7);

                        return Container(
                          width: Dimensions.colorRadius,
                          height: Dimensions.colorRadius,
                          margin: EdgeInsets.symmetric(
                              horizontal: AppDimensions.padding * 1),
                          child: Stack(
                            children: <Widget>[
                              Transform(
                                transform: Matrix4.identity()
                                  ..scale(
                                    animation,
                                    animation,
                                  ),
                                origin: Offset(offset, offset),
                                child: child,
                              ),
                              Center(
                                child: Container(
                                  width: innerCircleRadius,
                                  height: innerCircleRadius,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: color,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
