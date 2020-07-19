import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/App.dart';
import 'package:flutter_uis/UI.dart';

class Dimensions {
  static double headerHeight;
  static double logoHeight;

  static double shoeTop;
  static double shoeWidth;
  static double shoeHeight;

  static double sizeRadius;
  static double colorRadius;
  static init(BuildContext context) {
    App.init(context);

    sizeRadius = 18 + AppDimensions.ratio * 6;
    colorRadius = AppDimensions.ratio * 20;

    logoHeight = 30 + AppDimensions.ratio * 10;

    headerHeight = 60 + AppDimensions.ratio * 170;
    shoeWidth = 120 + AppDimensions.ratio * 80;
    shoeTop = headerHeight * 0.60;

    if (UI.sm) {
      headerHeight = 70 + AppDimensions.ratio * 180;
      shoeWidth = 120 + AppDimensions.ratio * 100;
      shoeTop = headerHeight * 0.55;
    }
    if (UI.lg) {
      headerHeight = 90 + AppDimensions.ratio * 200;
      shoeWidth = 150 + AppDimensions.ratio * 120;
      shoeTop = headerHeight * 0.55;
    }

    double safeShoeWidth = AppDimensions.size.width * 0.80;
    if (shoeWidth > safeShoeWidth) {
      shoeWidth = safeShoeWidth;
    }

    shoeHeight = shoeWidth * 0.50;
  }
}
