import 'package:flutter/material.dart';

import 'package:flutter_uis/UI.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';

class Dimensions {
  static double coverImageHeight;

  static double cardHeight;
  static double cardWidth;
  static double buttonWidth;

  static init(BuildContext context) {
    AppDimensions.init(context);

    coverImageHeight = 260;
    cardWidth = 280;
    cardHeight = 160;
    buttonWidth =
        (AppDimensions.maxContainerWidth - (AppDimensions.padding * 6)) / 2;

    if (UI.lg && UI.height > 600) {
      coverImageHeight = 380;
    }
    if (UI.xlg && UI.height > 800) {
      coverImageHeight = 500;
    }
  }
}
