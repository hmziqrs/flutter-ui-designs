import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/UI.dart';

class Dimensions {
  static double searchBarHeight;

  static double carouselHeight;
  static double carouselCardWidth;
  static double carouselPlanetSize;
  static double carouselAddIconSize;

  static double storyImageHeight;
  static double storyBaseWidth;

  static init(BuildContext context) {
    AppDimensions.init(context);

    searchBarHeight = 25 + AppDimensions.ratio * 15;

    storyImageHeight = 100 + AppDimensions.ratio * 40;
    storyBaseWidth = double.infinity;

    if (UI.lg) {
      double safePadding = AppDimensions.padding * 3;
      storyBaseWidth =
          ((AppDimensions.size.width - safePadding) / 2) - safePadding;
    }

    initCarousel();
  }

  static initCarousel() {
    carouselHeight = 150 + AppDimensions.ratio * 120;

    if (UI.md) {
      carouselHeight = 180 + AppDimensions.ratio * 140;
    }

    carouselCardWidth = carouselHeight * 0.7;
    carouselPlanetSize = carouselCardWidth * .80;
    carouselAddIconSize = 25 + AppDimensions.ratio * 12;
  }
}
