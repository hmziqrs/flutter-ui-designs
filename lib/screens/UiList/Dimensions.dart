import 'package:flutter/material.dart';
import 'package:flutter_uis/UI.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';

class Dimensions {
  static double cardHeight;
  static double cardWidth;

  static init(BuildContext context) {
    AppDimensions.init(context);
    cardHeight = 200;

    final cardBase = UI.safeWidth - AppDimensions.padding * 3;
    cardWidth = null;

    if (UI.md) {
      cardWidth = cardBase / 2;
    }
    if (UI.lg) {
      cardWidth = cardBase / 3;
    }
    if (UI.xlg) {
      cardWidth = cardBase / 4;
    }
    if (UI.xxlg) {
      cardWidth = cardBase / 5;
    }
  }
}
