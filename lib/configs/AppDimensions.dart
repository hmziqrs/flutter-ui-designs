import 'package:flutter/material.dart';

import 'package:flutter_uis/UI.dart';

class AppDimensions {
  static double maxContainerWidth;
  static double miniContainerWidth;

  static bool isLandscape;
  static double padding;
  static double ratio;

  static Size size;

  static init(BuildContext context) {
    UI.init(context);
    initPortrait();

    size = MediaQuery.of(context).size;

    maxContainerWidth = 540.0;
    miniContainerWidth = maxContainerWidth * 0.9;

    if (UI.lg) {
      maxContainerWidth = 700.0;
      miniContainerWidth = maxContainerWidth * 0.8;
    }
    if (UI.xl) {
      maxContainerWidth = 820.0;
      miniContainerWidth = maxContainerWidth * 0.7;
    }
    if (UI.xlg) {
      maxContainerWidth = 1000.0;
      miniContainerWidth = maxContainerWidth * 0.7;
    }

    if (maxContainerWidth > UI.getSize().width) {
      maxContainerWidth = UI.getSize().width;
      miniContainerWidth = UI.getSize().width - (AppDimensions.padding * 4);
    }
  }

  static initPortrait() {
    ratio = UI.width / UI.height;
    double pixelDensity = UI.mediaQuery().devicePixelRatio;
    ratio = (ratio) + ((pixelDensity + ratio) / 2);

    if (UI.width <= 380 && pixelDensity >= 3) {
      ratio *= 0.85;
    }

    initLargeScreens();
    initSmallScreensHighDesnsity();

    padding = ratio * 3;
  }

  static initLargeScreens() {
    final safe = 2.4;

    ratio *= 1.5;

    if (ratio > safe) {
      ratio = safe;
    }
  }

  static initSmallScreensHighDesnsity() {
    if (!UI.sm && ratio > 2.0) {
      ratio = 2.0;
    }
    if (!UI.xs && ratio > 1.7) {
      ratio = 1.7;
    }
    if (!UI.xxs && ratio > 1.5) {
      ratio = 1.5;
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
