import 'package:flutter/material.dart';
import 'package:flutter_uis/Widgets/ScreenAnimation/Base.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';
import 'package:provider/provider.dart';

import 'package:flutter_uis/configs/AppTheme.dart';

import 'package:flutter_uis/Providers/FadeScreen.dart';

class OverlayGradientFade<T extends FadeScreenProvider>
    extends StatelessWidget {
  const OverlayGradientFade({
    Key key,
    this.delay,
    this.colors,
    this.duration,
    @required this.height,
  }) : super(key: key);

  final int delay;
  final int duration;
  final double height;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    final colors = this.colors ??
        [
          AppTheme.primary.withOpacity(0.84),
          AppTheme.primary.withOpacity(0.01),
        ];

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: ScreenAnimationBase<T>(
        delay: delay,
        duration: duration,
        builder: (_, child, animation) {
          return Transform.translate(
            offset: Offset(0.0, -this.height + animation * this.height),
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
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter,
              stops: [0.15, 1.0],
              colors: colors,
            ),
          ),
        ),
      ),
    );
  }
}
