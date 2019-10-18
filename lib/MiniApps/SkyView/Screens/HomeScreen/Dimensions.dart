import 'package:flutter/material.dart';

import 'package:flutter_uis/UI.dart';

class Dimensions {
  static double padding;
  static double searchBarHeight;
  static double carouselHeight;
  static double carouselCardWidth;
  static double carouselPlanetSize;
  static double storyImageHeight;

  static init(
    BuildContext context, {
    Orientation orientation = Orientation.portrait,
  }) {
    // final size = MediaQuery.of(context).size;
    final bool isLandscape = Orientation.landscape == orientation;

    padding = UI.vertical;

    searchBarHeight = UI.horizontal * 12;
    carouselHeight = (UI.horizontal * 40) + UI.vertical * 22;
    carouselCardWidth = (UI.horizontal * 30) + UI.vertical * 15;
    carouselPlanetSize = carouselCardWidth * .80;
    storyImageHeight = UI.horizontal * 40;

    if (isLandscape) {
      padding = UI.horizontal;

      searchBarHeight = UI.horizontal * 6;
      carouselHeight = (UI.horizontal * 24) + UI.vertical * 30;
      carouselCardWidth = (UI.horizontal * 25) + UI.vertical * 12;
      carouselPlanetSize = carouselCardWidth * .80;

      storyImageHeight = UI.vertical * 40;
    }

    if (UI.isTablet) {
      padding = UI.vertical * 0.8;

      searchBarHeight = UI.horizontal * 7;

      carouselHeight = (UI.horizontal * 24) + UI.vertical * 15;
      carouselCardWidth = (UI.horizontal * 14) + UI.vertical * 14;
      carouselPlanetSize = carouselCardWidth * .80;
      storyImageHeight = UI.horizontal * 16;

      if (isLandscape) {
        padding = UI.horizontal * 0.8;
        searchBarHeight = UI.vertical * 7;
        carouselHeight = (UI.horizontal * 18) + UI.vertical * 15;
        carouselCardWidth = (UI.horizontal * 12) + UI.vertical * 12;
        carouselPlanetSize = carouselCardWidth * .80;

        storyImageHeight = UI.vertical * 20;
      }
    }
  }
}
