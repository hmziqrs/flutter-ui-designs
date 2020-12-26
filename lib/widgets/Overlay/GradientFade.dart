import 'package:flutter/material.dart';
import 'package:flutter_uis/widgets/ScreenAnimation/Base.dart';
// import 'package:simple_animations/simple_animations.dart';
// import 'package:supercharged/supercharged.dart';
// import 'package:provider/provider.dart';

import 'package:flutter_uis/configs/AppTheme.dart';

import 'package:flutter_uis/Providers/FadeScreen.dart';

class OverlayGradientFade<T extends FadeScreenProvider>
    extends StatelessWidget {
  const OverlayGradientFade({
    Key key,
    this.delay,
    this.fromTop = true,
    this.top,
    this.bottom,
    this.left = 0,
    this.right = 0,
    this.colors,
    this.duration,
    this.end = Alignment.bottomCenter,
    this.begin = Alignment.topCenter,
    @required this.height,
  }) : super(key: key);

  final int delay;
  final bool fromTop;
  final double top;
  final double bottom;
  final double left;
  final double right;
  final int duration;
  final double height;
  final Alignment begin;
  final Alignment end;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    final colors = this.colors ??
        [
          AppTheme.primary.withOpacity(0.84),
          AppTheme.primary.withOpacity(0.01),
        ];

    return Positioned(
      top: this.top,
      bottom: this.bottom,
      left: 0,
      right: 0,
      child: ScreenAnimationBase<T>(
        delay: delay,
        duration: duration,
        builder: (_, child, animation) {
          return Transform.translate(
            offset: Offset(
                0.0,
                !this.fromTop
                    ? this.height + animation * -this.height
                    : -this.height + animation * this.height),
            child: Opacity(
              opacity: animation,
              child: child,
            ),
          );
        },
        child: Container(
          height: this.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              end: this.end,
              begin: this.begin,
              stops: [0.15, 1.0],
              colors: colors,
            ),
          ),
        ),
      ),
    );
  }
}
