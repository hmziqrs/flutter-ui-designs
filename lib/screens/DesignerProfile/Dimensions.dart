import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/App.dart';
import 'package:flutter_uis/UI.dart';

class Dimensions {
  static late double avatarSize;
  static late double coverImageHeight;

  static late double buttonWidth;

  static late double cardWidth;
  static late double cardHeight;

  static void init(BuildContext context) {
    App.init(context);

    cardWidth = 280;
    cardHeight = 160;
    avatarSize = AppDimensions.padding * 14;
    coverImageHeight = AppDimensions.ratio * 100;
    buttonWidth =
        (AppDimensions.maxContainerWidth - 2 - (AppDimensions.padding * 8)) / 2;

    if (UI.md && UI.height > 480) {
      avatarSize = AppDimensions.padding * 17;
      coverImageHeight = AppDimensions.ratio * 130;
    }
    if (UI.lg && UI.height > 600) {
      avatarSize = AppDimensions.padding * 20;
      coverImageHeight = AppDimensions.ratio * 160;
    }
    if (UI.xlg && UI.height > 800) {
      coverImageHeight = AppDimensions.ratio * 200;
    }
  }
}
