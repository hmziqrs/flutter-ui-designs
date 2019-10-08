import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:simple_animations/simple_animations.dart';

import 'package:flutter_uis/Utils.dart';

import '../../../data/data.dart' as data;
import '../Dimensions.dart';

class Planet extends StatelessWidget {
  Planet(this.item, this.pageRendered, this.index, this.offset);
  final data.SpaceObject item;
  final bool pageRendered;
  final int index;
  final double offset;

  Widget renderContent(double animation) {
    double width = Dimensions.getSize().width;
    double widthIndex = width * this.index;

    double xOffset = 0;
    double rotationOffset = animation;
    double opacityOffset = rotationOffset;

    if (this.pageRendered) {
      rotationOffset = Utils.rangeMap(
        offset,
        widthIndex,
        width * (index + 1) - (width * .2),
        1.0,
        -0.38,
      );
      opacityOffset = rotationOffset;

      xOffset = Utils.rangeMap(
            offset,
            widthIndex,
            width * (index + 1),
            0,
            width,
          ) *
          0.38;
      if (offset < widthIndex) {
        xOffset = xOffset * .4;

        opacityOffset = Utils.rangeMap(
          offset,
          widthIndex - (width * 0.45),
          widthIndex,
          0.3,
          1.0,
        );
      } else if (offset > widthIndex) {
        xOffset = xOffset * -1;
      }
    }

    return Transform.rotate(
      origin: Dimensions.planetOrigin,
      angle: this.pageRendered ? rotationOffset : animation,
      child: Transform.translate(
        offset: Offset(xOffset, 0),
        child: Opacity(
          opacity:
              Utils.safeOpacity(this.pageRendered ? opacityOffset : animation),
          child: Container(
            alignment: Alignment.bottomRight,
            child: ControlledAnimation(
              playback: Playback.LOOP,
              delay: Duration(milliseconds: 1200),
              tween: Tween(begin: 0.0, end: math.pi * 2),
              duration: Duration(seconds: 50),
              builder: (ctx, rotation) {
                return Transform.rotate(
                  angle: rotation,
                  child: Container(
                    alignment: Alignment.center,
                    constraints: BoxConstraints(
                      maxHeight: Dimensions.planetSize,
                      maxWidth: Dimensions.planetSize,
                    ),
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(item.image),
                      ),
                    ),
                    child: null,
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
            child: ControlledAnimation(
              delay: Duration(milliseconds: 410),
              tween: Tween(begin: 0.0, end: 1.0),
              duration: Duration(milliseconds: 500),
              builder: (ctx, animation) => this.renderContent(animation),
            ),
          );
  }
}
