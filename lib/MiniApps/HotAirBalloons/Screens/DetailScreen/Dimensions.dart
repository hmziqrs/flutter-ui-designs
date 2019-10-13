import 'package:flutter/material.dart';

import 'package:flutter_uis/UI.dart';

class Dimensions {
  static Size size;

  static double padding;
  static double headerSpace;
  static double backgroudImageHeight;

  static init(
    BuildContext context, {
    Orientation orientation = Orientation.portrait,
  }) {
    size = MediaQuery.of(context).size;
    final bool isLandscape = Orientation.landscape == orientation;

    padding = UI.vertical;
    headerSpace = UI.vertical * 6;
    backgroudImageHeight = UI.vertical * 30;

    if (isLandscape) {
      padding = UI.horizontal;
      headerSpace = UI.vertical * 4;
      backgroudImageHeight = UI.vertical * 60;
    }

    if (UI.isTablet) {
      padding = UI.vertical * 0.9;

      if (isLandscape) {
        backgroudImageHeight = UI.vertical * 70;

        padding = UI.horizontal * 0.8;
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
