import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations/controlled_animation.dart';

import '../../../data/data.dart' as data;
import '../Dimensions.dart';

class SKVDetailScreenSpaceBackground extends StatelessWidget {
  SKVDetailScreenSpaceBackground({
    @required this.pageRendered,
    @required this.starsController,
    @required this.starsWidgetKey,
  });

  final bool pageRendered;
  final ScrollController starsController;
  final GlobalKey starsWidgetKey;

  @override
  Widget build(BuildContext context) {
    final tween = Tween(begin: 0.0, end: 0.45);
    return Positioned.fill(
      top: Dimensions.starBgTopSpace,
      bottom: Dimensions.starBgBottomSpace,
      child: ControlledAnimation(
        duration: Duration(milliseconds: 1200),
        tween: tween,
        builder: (ctx, animation) => Container(
          foregroundDecoration: BoxDecoration(
            color: Colors.black.withOpacity(
              this.pageRendered ? tween.end : animation,
            ),
          ),
          child: SingleChildScrollView(
            controller: this.starsController,
            scrollDirection: Axis.horizontal,
            physics: NeverScrollableScrollPhysics(),
            child: Row(
              key: this.starsWidgetKey,
              children: List.generate(
                data.objectList.length + 1,
                (index) => Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateX(0.0)
                    ..rotateY(index % 2 == 1 ? 0.0 : math.pi),
                  alignment: FractionalOffset.center,
                  child: Image.asset(
                    "assets/ma-skv/stars-bg.jpg",
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
