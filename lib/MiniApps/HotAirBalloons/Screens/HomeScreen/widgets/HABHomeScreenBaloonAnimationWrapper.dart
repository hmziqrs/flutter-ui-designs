import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class HABHomeScreenBaloonAnimationWrapper extends StatelessWidget {
  HABHomeScreenBaloonAnimationWrapper({
    @required this.imagePath,
    @required this.imageSize,
    this.opacity,
  });

  final String imagePath;
  final Size imageSize;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return CustomAnimation(
      delay: Duration(milliseconds: 100),
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 1800),
      builder: (ctx, child, animation) => Opacity(
        opacity: animation,
        child: Transform.scale(
          scale: animation,
          origin: Offset(0, 300),
          child: CustomAnimation(
            control: CustomAnimationControl.MIRROR,
            delay: Duration(milliseconds: 2200),
            tween: Tween(begin: -40.0, end: 10.0),
            duration: Duration(milliseconds: 2800),
            child: Opacity(
              opacity: opacity,
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
                width: imageSize.width,
                height: imageSize.height,
              ),
            ),
            builder: (ctx, child, translate) => Transform.translate(
              offset: Offset(0, translate),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
