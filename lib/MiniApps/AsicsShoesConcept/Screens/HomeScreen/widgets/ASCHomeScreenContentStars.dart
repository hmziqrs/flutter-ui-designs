import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/AppTheme.dart';

import '../../../models/ASCItem.dart';

class ASCHomeScreenContentStars extends StatelessWidget {
  ASCHomeScreenContentStars({
    required this.uiParallax,
    required this.activeColor,
    required this.item,
  });

  final double uiParallax;
  final Color activeColor;
  final ASCItem item;

  @override
  Widget build(BuildContext context) {
    final opacity = this.uiParallax * 0.15;
    final translateX = this.uiParallax * -15;
    final translateY = this.uiParallax * -3;
    final scale = this.uiParallax * 0.04;

    return Opacity(
      opacity: (1 - opacity).clamp(0.0, 1.0),
      child: Container(
        transform: Matrix4.identity()
          ..translate(translateX, translateY)
          ..scale(1 - scale, 1 - scale),
        child: Row(
          children: List.generate(
            5,
            (index) => Icon(
              MaterialCommunityIcons.star,
              size: 18 + AppDimensions.ratio + 10,
              color: this.item.stars > index
                  ? this.activeColor
                  : AppTheme.subText3,
            ),
          ),
        ),
      ),
    );
  }
}
