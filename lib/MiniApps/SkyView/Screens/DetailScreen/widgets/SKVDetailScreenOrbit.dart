import 'package:flutter/material.dart';
import 'package:flutter_uis/MiniApps/SkyView/Screens/DetailScreen/Provider.dart';
import 'package:flutter_uis/Mixins/HoverWidget.dart';
import 'package:flutter_uis/configs/AppDimensions.dart';

import 'package:flutter_uis/utils/Utils.dart';
import 'package:provider/provider.dart';

import '../Dimensions.dart';

class SKVDetailScreenOrbit extends StatelessWidget {
  SKVDetailScreenOrbit({
    required this.pageRendered,
    required this.index,
  });
  final bool pageRendered;
  final int index;

  @override
  Widget build(BuildContext context) {
    final tween = Tween(begin: Dimensions.orbitInitialOffset, end: 0.0);
    return this.pageRendered
        ? Selector<SKVDetailState, double>(
            selector: ((_, s) => s.offset),
            builder: (context, offset, child) {
              return this.renderContent(0.0, offset);
            },
          )
        : PlayAnimationBuilder(
            tween: tween,
            delay: Duration(milliseconds: 400),
            duration: Duration(milliseconds: 800),
            curve: Curves.fastLinearToSlowEaseIn,
            builder: (ctx, animation, child) =>
                this.renderContent(animation, 0.0),
          );
  }

  Widget renderContent(double animation, double offset) {
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
