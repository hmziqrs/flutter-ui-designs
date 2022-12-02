import 'package:flutter/material.dart';
import 'package:flutter_uis/UI.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';

class Dimensions {
  static late double cardHeight;
  static late double cardWidth;
  static late int chunks;

  static init(BuildContext context) {
    AppDimensions.init(context);
    cardHeight = 200;

    chunks = 1;

    if (UI.md) {
      chunks = 2;
    }
    if (UI.lg) {
      chunks = 3;
    }
    if (UI.xlg) {
      chunks = 4;
    }
    if (UI.xxlg) {
      chunks = 5;
    }
    final cardBase = UI.safeWidth - AppDimensions.padding * 2;
    cardWidth = cardBase / chunks;
  }
}
