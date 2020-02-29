import 'package:flutter/material.dart';
import 'package:flutter_uis/UI.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';

class Dimensions {
  static double headerHeight;
  static double logoHeight;

  static double shoeTop;
  static double shoeWidth;
  static double shoeHeight;

  static double sizeRadius;
  static double colorRadius;
  static init(BuildContext context) {
    AppDimensions.init(context);

    headerHeight = AppDimensions.ratio * 290;
    logoHeight = 30 + AppDimensions.ratio * 10;

    sizeRadius = 18 + AppDimensions.ratio * 6;
    colorRadius = AppDimensions.ratio * 20;

    shoeTop = headerHeight * 0.65;
    shoeWidth = AppDimensions.ratio * 190;
    shoeHeight = shoeWidth * 0.55;

    double safeShoeWidth = AppDimensions.size.width * 0.90;

    if (UI.xs) {
      // print("UI.XS");
      shoeWidth = AppDimensions.ratio * 200;
      shoeHeight = shoeWidth * 0.5;

      shoeTop = headerHeight * 0.60;
    }
    if (UI.sm) {
      headerHeight = AppDimensions.ratio * 280;
      shoeTop = headerHeight * 0.55;
      // print("UI.SM");
    }
    if (UI.md) {
      // print("UI.MD");
      shoeWidth = AppDimensions.ratio * 220;
      shoeHeight = shoeWidth * 0.5;

      shoeTop = headerHeight * 0.60;
    }

    if (shoeWidth > safeShoeWidth) {
      shoeWidth = safeShoeWidth;
    }
  }

  static initShoe() {}
}
