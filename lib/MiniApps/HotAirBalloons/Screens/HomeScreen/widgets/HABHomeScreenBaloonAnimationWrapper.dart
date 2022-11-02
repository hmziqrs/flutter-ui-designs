import 'package:flutter/material.dart';
import 'package:flutter_uis/Mixins/HoverWidget.dart';

class HABHomeScreenBallonAnimationWrapper extends StatelessWidget {
  HABHomeScreenBallonAnimationWrapper({
    required this.imagePath,
    required this.imageSize,
    required this.opacity,
  });

  final String imagePath;
  final Size imageSize;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return CustomAnimationBuilder(
      delay: Duration(milliseconds: 100),
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 1800),
      builder: (ctx, animation, child) => Opacity(
        opacity: animation,
        child: Transform.scale(
          scale: animation,
          origin: Offset(0, 300),
          child: CustomAnimationBuilder(
            control: Control.mirror,
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
            builder: (ctx, translate, child) => Transform.translate(
              offset: Offset(0, translate),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
