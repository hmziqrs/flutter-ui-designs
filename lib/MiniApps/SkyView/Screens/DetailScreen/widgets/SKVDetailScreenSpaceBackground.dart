import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:provider/provider.dart';

import '../../../data/data.dart' as data;
import '../Dimensions.dart';
import '../Provider.dart';

class SKVDetailScreenSpaceBackground extends StatelessWidget {
  SKVDetailScreenSpaceBackground();

  @override
  Widget build(BuildContext context) {
    final state = SKVDetailState.state(context);

    final tween = Tween(begin: 0.0, end: 0.45);
    return Positioned.fill(
      top: Dimensions.starBgTopSpace,
      bottom: Dimensions.starBgBottomSpace,
      child: PlayAnimation(
        tween: tween,
        child: SingleChildScrollView(
          controller: state.starsController,
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),
          child: Row(
            key: state.starsWidgetKey,
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
        duration: Duration(milliseconds: 1200),
        builder: (ctx, child, animation) => Selector<SKVDetailState, bool>(
          selector: (_, s) => s.pageRendered,
          builder: (context, pageRendered, _) {
            return Container(
              foregroundDecoration: BoxDecoration(
                color: Colors.black.withOpacity(
                  pageRendered ? tween.end : animation,
                ),
              ),
              child: child,
            );
          },
        ),
      ),
    );
  }
}
