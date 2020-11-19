import 'package:flutter/material.dart';
import 'package:tinycolor/tinycolor.dart';

import 'package:flutter_uis/configs/App.dart';

abstract class ETCTheme {
  static Color color1;
  static Color color2;

  static void init() {
    color1 = TinyColor.fromString('#f5f5f5').color;
    color2 = TinyColor.fromString('#e8e8e8').color;

    if (App.isDark()) {
      color1 = TinyColor.fromString('#0a0a0a').color;
      color2 = TinyColor.fromString('#171717').color;
    }
  }
}
