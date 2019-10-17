import 'package:flutter/material.dart';

import 'package:flutter_uis/UI.dart';

class Dimensions {
  static Size size;

  static double padding;
  static double containerMaxWidth;

  static init(
    BuildContext context, {
    Orientation orientation = Orientation.portrait,
  }) {
    final bool isLandscape = Orientation.landscape == orientation;

    size = MediaQuery.of(context).size;
    padding = UI.vertical;
    containerMaxWidth = 540;

    if (isLandscape) {
      padding = UI.horizontal;
    }

    if (UI.isTablet) {
      //
      if (isLandscape) {}

      if (UI.diagonal > 1250) {
        padding = UI.horizontal * 0.8;

        if (isLandscape) {
          // cardHeight = UI.vertical * 50;
          padding = UI.horizontal * 0.7;
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
