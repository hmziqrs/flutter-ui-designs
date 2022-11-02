import 'package:flutter/material.dart';

import 'package:flutter_uis/UI.dart';
import 'package:flutter_uis/configs/AppDimensions.dart';

class Dimensions {
  static late double planetSize;
  static late double orbitInitialOffset;
  static late double starBgBottomSpace;
  static late double starBgTopSpace;

  static init(BuildContext context) {
    AppDimensions.init(context);

    orbitInitialOffset = -UI.horizontal * 80;

    planetSize = 120 + AppDimensions.ratio * 60;

    starBgTopSpace = 0.0;
    starBgBottomSpace = -UI.vertical * 10;

    if (UI.md) {
      planetSize = 140 + AppDimensions.ratio * 70;
    }
    if (UI.lg) {
      planetSize = 150 + AppDimensions.ratio * 75;
    }
  }
}
