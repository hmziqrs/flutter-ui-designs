import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/App.dart';

import '../../../ models/ASCItem.dart';
import '../messages/keys.dart';

class ASCHomeScreenContentPriceBadge extends StatelessWidget {
  ASCHomeScreenContentPriceBadge({
    @required this.activeColor,
    @required this.uiParallax,
    @required this.item,
  });

  final Color activeColor;
  final double uiParallax;
  final ASCItem item;

  @override
  Widget build(BuildContext context) {
    final opacity = this.uiParallax * 0.14;
    final translate = this.uiParallax * -8;

    return Opacity(
      opacity: (1 - opacity).clamp(0.0, 1.0),
      child: Container(
        transform: Matrix4.identity()..translate(0.0, translate),
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.padding * 5,
          vertical: AppDimensions.padding * 3.5,
        ),
        decoration: BoxDecoration(
          color: this.activeColor,
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(12.0),
          ),
        ),
        child: RichText(
          text: TextSpan(
            text: "${App.translate(ASCHomeScreenMessages.usd)} ",
            style: TextStyle(
              fontSize: 10 + AppDimensions.ratio * 4,
            ),
            children: [
              TextSpan(
                text: this.item.price.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
