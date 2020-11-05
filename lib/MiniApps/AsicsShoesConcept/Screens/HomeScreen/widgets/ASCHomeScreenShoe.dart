import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';

import '../../../models/ASCItem.dart';
import '../Dimensions.dart';

class ASCHomeScreenShoe extends StatelessWidget {
  ASCHomeScreenShoe({
    @required this.item,
    @required this.uiParallax,
  });

  final ASCItem item;
  final double uiParallax;

  @override
  Widget build(BuildContext context) {
    double width = Dimensions.shoeWidth;
    double height = Dimensions.shoeHeight;

    final scale = this.uiParallax * -0.12;
    final opacity = this.uiParallax * 0.15;

    return Positioned(
      top: Dimensions.shoeTop,
      // left: (AppDimensions.size.width / 2) - width * 0.4,
      left: (AppDimensions.size.width / 2) - width * 0.45,
      child: Transform(
        transform: Matrix4.identity()
          ..rotateZ((24 + (this.uiParallax * 15)) * 3.1415927 / 180)
          ..scale(1 + scale, 1 + scale)
          ..translate(this.uiParallax * -35),
        origin: Offset(width / 2, height / 2),
        child: Opacity(
          opacity: (1 - opacity).clamp(0.0, 1.0),
          child: Container(
            width: width,
            height: height,
            // color: Colors.red,
            alignment: Alignment.center,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Positioned(
                  bottom: Dimensions.shoeHeight * 0.08,
                  left: AppDimensions.ratio * 10,
                  right: AppDimensions.ratio * 10,
                  child: Container(
                    height: AppDimensions.ratio * 1,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 30,
                          spreadRadius: 16,
                          color: Colors.black.withOpacity(0.55),
                        )
                      ],
                    ),
                  ),
                ),
                Container(child: Image.asset(this.item.shoeImage)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
