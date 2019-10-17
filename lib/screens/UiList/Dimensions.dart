import 'package:flutter/material.dart';

import 'package:flutter_uis/UI.dart';

class Dimensions {
  static Size size;

  static double padding;
  static double cardHeight;
  static double cardWidth;
  static int gridCount;

  static init(
    BuildContext context, {
    Orientation orientation = Orientation.portrait,
  }) {
    size = MediaQuery.of(context).size;
    final bool isLandscape = Orientation.landscape == orientation;

    // padding = UI.horizontal * 3;
    padding = UI.horizontal * 3;
    cardHeight = UI.horizontal * 60;
    cardWidth = UI.horizontal * 100;
    gridCount = 1;

    if (isLandscape) {
      cardHeight = (UI.vertical * 30) + UI.horizontal * 25;
      padding = UI.horizontal * 1.5;
    }

    if (UI.isTablet) {
      padding = UI.horizontal * 2;

      if (isLandscape) {
        cardHeight = UI.vertical * 58;
        cardWidth = UI.horizontal * 50;
        gridCount = 2;
      }

      if (UI.diagonal > 1250) {
        padding = UI.horizontal * 1.8;
        cardHeight = UI.vertical * 45;
        gridCount = 2;
        if (isLandscape) {
          gridCount = 3;
          cardHeight = UI.vertical * 50;
          padding = UI.horizontal * 1.1;
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
