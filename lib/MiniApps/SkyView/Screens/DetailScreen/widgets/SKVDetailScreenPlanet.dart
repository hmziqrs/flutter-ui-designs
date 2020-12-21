import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/Utils.dart';

import '../../../data/data.dart' as data;
import '../Dimensions.dart';

class SKVDetailScreenPlanet extends StatelessWidget {
  SKVDetailScreenPlanet({
    @required this.item,
    @required this.pageRendered,
    @required this.index,
    @required this.offset,
  });
  final data.SKVObject item;
  final bool pageRendered;
  final int index;
  final double offset;

  Widget renderContent(double animation) {
    final width = AppDimensions.size.width;
    // This variale helps us calculate parallax for each page.
    final widthOffset = this.offset - (width * this.index);
    final rotateRatio = math.pi / 180;

    double opacityOffset = animation;

    // Init offSet bascially works like rotate origin here we set the center of radius
    double initOffSetX =
        AppDimensions.size.width - (Dimensions.planetSize * 0.5);
    double initOffSetY =
        (AppDimensions.size.height * 0.5) - (Dimensions.planetSize * 0.5);

    final radiusY = AppDimensions.size.height * 0.5;
    final radiusX = AppDimensions.size.width * 0.5;

    double angle = Utils.rangeMap(widthOffset, 0, width, -90, -200);

    /* pageRendered variable is very important
    becuase it is responsible to trigger animation when use first navigate to this screen*/
    if (this.pageRendered) {
      opacityOffset = Utils.rangeMap(
        widthOffset,
        0.0,
        width * 0.8,
        1.0,
        0.0,
      );
      // This condition resets the opacity when user is scrolling back from the page.
      if (opacityOffset > 1) {
        opacityOffset = 1 - (opacityOffset - 1);
      }
    } else {
      angle = Utils.rangeMap(animation, 0, 1.0, -200, -90);
    }

    final sin = initOffSetX + (math.sin(angle * rotateRatio) * radiusX);
    final cos = initOffSetY + (math.cos(angle * rotateRatio) * -radiusY);

    return Opacity(
      opacity: (this.pageRendered ? opacityOffset : animation).clamp(0.0, 1.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Transform(
          transform: Matrix4.identity()
            ..translate(
              sin,
              cos,
            )
            ..rotateZ(0 * rotateRatio),
          child: Container(
            width: Dimensions.planetSize,
            height: Dimensions.planetSize,
            alignment: Alignment.bottomCenter,
            child: CustomAnimation(
              control: CustomAnimationControl.LOOP,
              delay: Duration(milliseconds: this.pageRendered ? 800 : 1400),
              tween: Tween(begin: 0.0, end: math.pi * 2),
              duration: Duration(seconds: 50),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(item.image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              builder: (ctx, child, rotation) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(Dimensions.planetSize),
                  child: Container(
                    width: Dimensions.planetSize,
                    height: Dimensions.planetSize,
                    foregroundDecoration: BoxDecoration(
                      gradient: RadialGradient(
                        center: Alignment(0.30, -0.40),
                        colors: [
                          Colors.white.withOpacity(0.09),
                          Colors.transparent,
                          Colors.black.withOpacity(0.85),
                        ],
                        radius: 0.68,
                      ),
                    ),
                    child: Transform.rotate(
                      angle: rotation,
                      child: child,
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

  @override
  Widget build(BuildContext context) {
    return this.pageRendered
        ? this.renderContent(1.0)
        : Positioned.fill(
            left: 0,
            right: 0,
            child: CustomAnimation(
              delay: Duration(milliseconds: 410),
              tween: Tween(begin: 0.0, end: 1.0),
              duration: Duration(milliseconds: 500),
              builder: (ctx, child, animation) => this.renderContent(animation),
            ),
          );
  }
}
