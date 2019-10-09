import 'package:flutter/material.dart';

import 'package:flutter_uis/UI.dart';

class Dimensions {
  static double searchBarHeight;
  static double carouselHeight;
  static double carouselCardWidth;
  static double carouselPlanetSize;

  static init(
    BuildContext context, {
    Orientation orientation = Orientation.portrait,
  }) {
    // final size = MediaQuery.of(context).size;
    final bool isLandscape = Orientation.landscape == orientation;

    searchBarHeight = UI.vertical * 6.5;
    carouselHeight = UI.vertical * 50;
    carouselCardWidth = UI.horizontal * 60;
    carouselPlanetSize = carouselCardWidth * .82;

    if (isLandscape) {}
  }
}
