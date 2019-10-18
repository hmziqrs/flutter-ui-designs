import 'package:flutter/material.dart';

import 'package:flutter_uis/UI.dart';

class Dimensions {
  static Size size;

  static double padding;
  static double planetSize;
  static double palnetContainerWidth;
  static Offset planetOrigin;
  static double orbitInitialOffset;
  static double starBgBottomSpace;
  static double starBgTopSpace;

  static init(
    BuildContext context, {
    Orientation orientation = Orientation.portrait,
  }) {
    size = MediaQuery.of(context).size;
    final bool isLandscape = Orientation.landscape == orientation;

    padding = UI.vertical;
    orbitInitialOffset = -UI.horizontal * 80;
    planetSize = UI.horizontal * 45;
    palnetContainerWidth = size.width;
    planetOrigin = Offset(UI.vertical * 39, UI.horizontal * 9);

    starBgTopSpace = 0.0;
    starBgBottomSpace = -UI.vertical * 10;

    if (isLandscape) {
      padding = UI.horizontal;

      planetSize = UI.vertical * 48;
      planetOrigin = Offset(UI.vertical * 50, -UI.horizontal * 25);

      palnetContainerWidth = size.height;
      starBgBottomSpace = -UI.vertical * 30;
      starBgTopSpace = -UI.vertical * 30;
    }

    if (UI.isTablet) {
      padding = UI.vertical * 0.8;

      planetSize = UI.vertical * 26;
      planetOrigin = Offset(UI.vertical * 42, -UI.horizontal * 2);

      starBgTopSpace = 0.0;
      starBgBottomSpace = 0.0;

      if (isLandscape) {
        padding = UI.horizontal * 0.8;

        planetSize = UI.horizontal * 20;
        planetOrigin = Offset(UI.vertical * 60, -UI.horizontal * 25);

        palnetContainerWidth = size.height;

        starBgTopSpace = 0.0;
        starBgBottomSpace = 0.0;
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
