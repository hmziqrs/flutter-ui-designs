import 'package:flutter/material.dart';

import 'package:flutter_uis/UI.dart';
import 'package:flutter_uis/configs/App.dart';
import 'package:flutter_uis/configs/AppDimensions.dart';

class Dimensions {
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
    App.init(context);
    final bool isLandscape = Orientation.landscape == orientation;

    flightCardWidth = UI.horizontal * 40;

    shapeTransform = Matrix4.translationValues(
        -UI.horizontal * 17, AppDimensions.padding * 10, 0.0)
      ..scale(1.6);

    balloonSize = Size(UI.horizontal * 100, UI.vertical * 80);
    balloonOffset = Offset(-UI.horizontal * 17, -UI.vertical * 12);
    balloonShadowSize = Size(UI.horizontal * 100, UI.vertical * 90);
    balloonShadowOffset = Offset(-UI.horizontal * 34, -UI.vertical * 2);

    if (isLandscape) {
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
      flightCardWidth = UI.horizontal * 30;

      if (isLandscape) {
        flightCardWidth = UI.horizontal * 20;
      }

      if (UI.diagonal > 1250) {
        flightCardWidth = UI.horizontal * 22;

        if (isLandscape) {
          flightCardWidth = UI.horizontal * 16;
        }
      }
    }
  }
}
