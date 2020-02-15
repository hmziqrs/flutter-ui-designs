import 'package:flutter/material.dart';

import 'package:flutter_uis/UI.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';

class Dimensions {
  static double redBackground;
  static double avatarSize;

  static init(BuildContext context) {
    AppDimensions.init(context);

    redBackground = AppDimensions.ratio * 60;
    avatarSize = AppDimensions.ratio * 60;

    if (UI.md && UI.height > 480) {
      avatarSize = AppDimensions.padding * 17;
      redBackground = AppDimensions.ratio * 80;
    }
    if (UI.lg && UI.height > 600) {
      avatarSize = AppDimensions.padding * 20;
      redBackground = AppDimensions.ratio * 120;
    }
    if (UI.xlg && UI.height > 800) {
      redBackground = AppDimensions.ratio * 160;
    }
  }
}
