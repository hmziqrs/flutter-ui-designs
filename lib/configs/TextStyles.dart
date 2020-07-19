import 'package:flutter/material.dart';

import 'AppDimensions.dart';

abstract class TextStyles {
  static TextStyle heading1;
  static TextStyle heading2;
  static TextStyle heading3;

  static init() {
    // INIT HEADINGS
    heading1 = TextStyle(
      fontSize: 20 + AppDimensions.ratio * 10,
      fontWeight: FontWeight.w700,
    );
    heading2 = TextStyle(
      fontSize: 16 + AppDimensions.ratio * 8,
      fontWeight: FontWeight.w600,
    );
    heading3 = TextStyle(
      fontSize: 14 + AppDimensions.ratio * 6,
      fontWeight: FontWeight.w600,
    );
  }
}
