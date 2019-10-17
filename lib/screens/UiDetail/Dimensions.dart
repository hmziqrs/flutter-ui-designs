import 'package:flutter/material.dart';

import 'package:flutter_uis/UI.dart';

class Dimensions {
  static Size size;

  static double padding;
  static double coverImageHeight;
  static double containerMaxWidth;

  static double cardHeight;
  static double cardWidth;

  static init(
    BuildContext context, {
    Orientation orientation = Orientation.portrait,
  }) {
    size = MediaQuery.of(context).size;
    final bool isLandscape = Orientation.landscape == orientation;

    containerMaxWidth = 540;
    // padding = UI.vertical * 0.9;
    padding = UI.horizontal * 1.5;

    coverImageHeight = UI.vertical * 34;

    cardWidth = UI.horizontal * 70;
    cardHeight = UI.vertical * 26;

    if (isLandscape) {
      coverImageHeight = UI.vertical * 60;
      padding = UI.horizontal * 0.9;

      cardWidth = UI.horizontal * 60;
      cardHeight = UI.vertical * 55;
    }

    if (UI.isTablet) {
      //
      if (isLandscape) {
        cardWidth = UI.horizontal * 45;
        cardHeight = UI.vertical * 45;
      }

      if (UI.diagonal > 1250) {
        padding = UI.horizontal * 0.8;
        cardHeight = UI.vertical * 20;
        cardWidth = UI.horizontal * 45;

        if (isLandscape) {
          // cardHeight = UI.vertical * 50;
          padding = UI.horizontal * 0.7;
          cardHeight = UI.vertical * 30;
          cardWidth = UI.horizontal * 30;
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
