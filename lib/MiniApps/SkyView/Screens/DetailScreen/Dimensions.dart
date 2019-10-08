import 'package:flutter/material.dart';

import 'package:flutter_uis/UI.dart';

class Dimensions {
  static Size size;

  static double planetSize;
  static Offset planetOrigin;
  static double orbitInitialOffset;

  static init(
    BuildContext context, {
    Orientation orientation = Orientation.portrait,
  }) {
    size = MediaQuery.of(context).size;
    final bool isLandscape = Orientation.landscape == orientation;

    orbitInitialOffset = -UI.horizontal * 80;
    planetSize = UI.horizontal * 66;
    planetOrigin = Offset(UI.vertical * 39, UI.horizontal * 9);

    if (isLandscape) {}
  }

  static Size getSize() {
    if (size != null) {
      return size;
    }
    return UI.mediaQuery().size;
  }
}
