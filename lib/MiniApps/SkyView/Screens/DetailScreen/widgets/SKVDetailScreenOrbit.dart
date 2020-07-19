import 'package:flutter/material.dart';
import 'package:flutter_uis/configs/AppDimensions.dart';

import 'package:simple_animations/simple_animations.dart';

import 'package:flutter_uis/Utils.dart';

import '../Dimensions.dart';

class SKVDetailScreenOrbit extends StatelessWidget {
  SKVDetailScreenOrbit({
    @required this.pageRendered,
    @required this.index,
    @required this.offset,
  });
  final bool pageRendered;
  final int index;
  final double offset;

  @override
  Widget build(BuildContext context) {
    final tween = Tween(begin: Dimensions.orbitInitialOffset, end: 0.0);
    return this.pageRendered
        ? this.renderContent(0.0)
        : ControlledAnimation(
            duration: Duration(milliseconds: 800),
            tween: tween,
            delay: Duration(milliseconds: 400),
            curve: Curves.fastLinearToSlowEaseIn,
            builder: (ctx, animation) => this.renderContent(animation),
          );
  }

  Widget renderContent(double animation) {
    final opacity = Utils.rangeMap(
      animation,
      Dimensions.orbitInitialOffset,
      0.0,
      0.0,
      1.0,
    );

    double xOffset = 0;
    double opacityOffset = 1;

    double width = AppDimensions.size.width;
    double widthIndex = width * this.index;

    if (this.pageRendered) {
      xOffset = Utils.rangeMap(
            offset,
            widthIndex,
            width * (index + 1),
            0,
            width,
          ) *
          -0.55;

      if (offset < widthIndex) {
        opacityOffset = Utils.rangeMap(
          offset,
          widthIndex - (width * 0.45),
          widthIndex,
          0.0,
          1.0,
        );
      }
      if (offset > widthIndex) {
        opacityOffset = Utils.rangeMap(
          offset,
          widthIndex,
          (width * (index + 1) - (width * 0.45)),
          1.0,
          0.0,
        );
      }

      opacityOffset = opacityOffset.clamp(0.0, 1.0);
    }

    return Positioned(
      top: 0,
      bottom: 0,
      left: 0,
      right: animation,
      child: Opacity(
        opacity: this.pageRendered ? opacityOffset : opacity,
        child: Transform.translate(
          offset: Offset(xOffset, 0),
          child: Image.asset(
            "assets/ma-skv/gradient-path.png",
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}
