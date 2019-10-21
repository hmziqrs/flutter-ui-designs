import 'package:flutter/material.dart';

import 'package:flutter_uis/UI.dart';

class AppDimensions {
  // Constants
  static double maxContainerWidth = 540.0;

  // Changes based on screen size
  static bool isLandscape;
  static double padding;
  static double ratio;

  static init(BuildContext context, Orientation orientation) {
    UI.init(context);

    isLandscape = orientation == Orientation.landscape;

    if (isLandscape) {
      initLandscape();
    } else {
      initPortrait();
    }
  }

  static initPortrait() {
    ratio = UI.width / UI.height;
    double pixelDensity = UI.mediaQuery().devicePixelRatio;
    ratio = (ratio) + ((pixelDensity + ratio) / 2);

    if (UI.width <= 380 && pixelDensity >= 3) {
      ratio *= 0.85;
    }

    padding = ratio * 3;
    // padding = UI.vertical;
  }

  static initLandscape() {
    ratio = UI.height / UI.width;
    double pixelDensity = UI.mediaQuery().devicePixelRatio;
    ratio = (ratio) + ((pixelDensity + ratio) / 2);

    if (UI.height <= 380 && pixelDensity >= 3) {
      ratio *= 0.85;
    }

    padding = ratio * 3;
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
