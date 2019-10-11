import 'package:flutter/material.dart';

import 'package:simple_animations/simple_animations.dart';

import 'package:flutter_uis/Utils.dart';

import '../Dimensions.dart';

class Orbit extends StatelessWidget {
  Orbit(this.pageRendered, this.index, this.offset);
  final bool pageRendered;
  final int index;
  final double offset;

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

    double width = Dimensions.getSize().width;
    double widthIndex = width * this.index;

    if (this.pageRendered) {
      xOffset = -Utils.rangeMap(
            offset,
            widthIndex,
            width * (index + 1),
            0,
            width,
          ) *
          0.55;

      if (offset < widthIndex) {
        // print("$index $offset < $widthIndex ${offset < widthIndex}");
        opacityOffset = Utils.rangeMap(
          offset,
          widthIndex - (width * 0.45),
          widthIndex,
          0.0,
          1.0,
        );
        // print("opacity: $opacityOffset");
      } else if (offset > widthIndex) {
        opacityOffset = Utils.rangeMap(
          offset,
          widthIndex,
          (width * (index + 1) - (width * 0.45)),
          1.0,
          0.0,
        );
      }

      // print(
      //     "\n\nindex:$index  opacity:$opacityOffset\noffset: $offset \ninMin:${width * index} inMax:${(width * (index + 1) - (width * .33))}\n\n");
      opacityOffset = Utils.safeOpacity(opacityOffset);
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
            "assets/ma-sk/gradient-path.png",
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }

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
}
