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

  static init(BuildContext context) {
    App.init(context);
    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    flightCardWidth = 60 + AppDimensions.ratio * 50;

    shapeTransform = Matrix4.translationValues(
      -UI.horizontal * 17,
      AppDimensions.padding * 10,
      0.0,
    )..scale(1.6);

    balloonSize = Size(UI.horizontal * 100, UI.vertical * 80);
    balloonOffset = Offset(-UI.horizontal * 17, -UI.vertical * 12);

    balloonShadowSize = Size(UI.horizontal * 100, UI.vertical * 90);
    balloonShadowOffset = Offset(
      balloonOffset.dx * 2.2,
      balloonOffset.dx * 0.1,
    );

    if (isLandscape) {
      shapeTransform = Matrix4.translationValues(
        -UI.horizontal * 55,
        UI.vertical * 16,
        0.0,
      )..scale(2.2);

      balloonOffset = Offset(-UI.horizontal * 25, -UI.vertical * 12);
      balloonShadowOffset = Offset(
        balloonOffset.dx * 1.4,
        balloonOffset.dx * 0.15,
      );
    }
  }
}
