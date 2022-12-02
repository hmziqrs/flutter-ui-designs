import 'package:flutter/material.dart';
import 'package:flutter_uis/configs/App.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import '../messages/keys.dart';

class ASCHomeScreenContentBadge extends StatelessWidget {
  ASCHomeScreenContentBadge({
    required this.uiParallax,
    required this.activeColor,
  });

  final double uiParallax;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    final translate = this.uiParallax * -25;
    final scale = this.uiParallax * 0.05;
    final opacity = this.uiParallax * 0.13;
    return Opacity(
      opacity: (1 - opacity).clamp(0.0, 1.0),
      child: Container(
        transform: Matrix4.identity()
          ..translate(translate, scale * 10)
          ..scale(1 - scale),
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.padding * 5,
          vertical: AppDimensions.padding * 2,
        ),
        decoration: BoxDecoration(
          color: this.activeColor,
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Text(
          App.translate(
            ASCHomeScreenMessages.newText,
            context,
          ),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 8 + AppDimensions.ratio * 4,
          ),
        ),
      ),
    );
  }
}
