import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/App.dart';
import 'package:flutter_uis/UI.dart';

class Dimensions {
  static late double coverImageHeight;

  static late double cardWidth;
  static late double cardHeight;
  static late double buttonWidth;

  static init(BuildContext context) {
    App.init(context);

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
