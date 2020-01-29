import 'package:flutter/material.dart';

import 'package:flutter_uis/UI.dart';

class AppDimensions {
  // Constants
  static double maxContainerWidth;

  // Changes based on screen size
  static bool isLandscape;
  static double padding;
  static double ratio;

  static init(BuildContext context) {
    UI.init(context);

    maxContainerWidth = 540.0;

    if (UI.lg) {
      maxContainerWidth = 700.0;
    }
    if (UI.xl) {
      maxContainerWidth = 820.0;
    }
    if (UI.xlg) {
      maxContainerWidth = 1000.0;
    }

    if (maxContainerWidth > UI.getSize().width) {
      maxContainerWidth = UI.getSize().width;
    }

    initPortrait();
  }

  static initPortrait() {
    ratio = UI.width / UI.height;
    double pixelDensity = UI.mediaQuery().devicePixelRatio;
    ratio = (ratio) + ((pixelDensity + ratio) / 2);

    if (UI.width <= 380 && pixelDensity >= 3) {
      ratio *= 0.85;
    }
    // print('Utils.isDesktop() ${Utils.isDesktop()}');
    initLargeScreens();

    padding = ratio * 3;
    // padding = UI.vertical;
  }

  static initLargeScreens() {
    final safe = 2.4;

    ratio *= 1.5;

    if (ratio > safe) {
      ratio = safe;
    }
  }

  static String inString() {
    final ratio = UI.width / UI.height;
    return """
      Width: ${UI.width}
      Height: ${UI.height}
      ratio: $ratio
      pixels: ${UI.mediaQuery().devicePixelRatio}
    """;
  }
}
