import 'package:flutter/material.dart';

import 'package:flutter_uis/UI.dart';

class Dimensions {
  static Size size;

  static double padding;
  static double flightCardWidth;

  static Matrix4 shapeTransform;

  static Size balloonSize;
  static Size balloonShadowSize;

  static Offset balloonOffset;
  static Offset balloonShadowOffset;

  static init(
    BuildContext context, {
    Orientation orientation = Orientation.portrait,
  }) {
    size = MediaQuery.of(context).size;
    final bool isLandscape = Orientation.landscape == orientation;

    padding = UI.vertical;
    flightCardWidth = UI.horizontal * 40;

    shapeTransform = Matrix4.translationValues(
        -UI.horizontal * 17, Dimensions.padding * 10, 0.0)
      ..scale(1.6);

    balloonSize = Size(UI.horizontal * 100, UI.vertical * 80);
    balloonOffset = Offset(-UI.horizontal * 17, -UI.vertical * 12);
    balloonShadowSize = Size(UI.horizontal * 100, UI.vertical * 90);
    balloonShadowOffset = Offset(-UI.horizontal * 34, -UI.vertical * 2);

    if (isLandscape) {
      padding = UI.horizontal;
      flightCardWidth = UI.horizontal * 26;

      shapeTransform = Matrix4.translationValues(
        -UI.horizontal * 55,
        UI.vertical * 16,
        0.0,
      )..scale(2.2);

      balloonOffset = Offset(-UI.horizontal * 25, -UI.vertical * 12);
      balloonShadowOffset = Offset(-UI.horizontal * 33, -UI.vertical * 4);
    }

    if (UI.isTablet) {
      padding = UI.vertical * 0.9;
      flightCardWidth = UI.horizontal * 30;

      if (isLandscape) {
        padding = UI.horizontal * 0.9;
        flightCardWidth = UI.horizontal * 20;
      }

      if (UI.diagonal > 1250) {
        padding = UI.vertical * 0.8;

        flightCardWidth = UI.horizontal * 22;

        if (isLandscape) {
          padding = UI.horizontal * 0.8;
          flightCardWidth = UI.horizontal * 16;
        }
      }
    }
  }

  static Size getSize() {
    if (size != null) {
      return size;
    }
    return UI.mediaQuery().size;
  }
}
