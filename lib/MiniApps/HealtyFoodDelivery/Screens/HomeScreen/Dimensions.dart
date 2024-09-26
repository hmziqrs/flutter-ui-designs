import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/App.dart';

class Dimensions {
  static late double chipsContainerWidth;

  static late double itemBaseWidth;
  static late double itemBaseHeight;
  static late double itemContentWidth;
  static late double itemDiscountSize;

  static late double categoryBaseSize;

  static late double restaurantContainerHeight;
  static late double restaurantCardFraction;
  // static late double chipsContainerWidth;

  static init(BuildContext context) {
    App.init(context);

    chipsContainerWidth = 480;

    initItemSize();

    categoryBaseSize = 30 + AppDimensions.ratio * 15;

    initRestaurantSize();
  }

  static initItemSize() {
    itemBaseWidth = 180 + AppDimensions.ratio * 50;
    itemBaseHeight = itemBaseWidth * 1.2;
    itemDiscountSize = 30 + AppDimensions.ratio * 12;

    double safeHeight = AppDimensions.size.height * 0.7;
    if (itemBaseHeight > safeHeight) {
      itemBaseHeight = safeHeight;
      itemBaseWidth = itemBaseHeight * 0.9;
    }

    itemContentWidth = itemBaseWidth * 0.8;
  }

  static initRestaurantSize() {
    restaurantCardFraction = 0.88;
    double baseWidth = 250 + AppDimensions.ratio * 100;
    double safeBaseWidth = AppDimensions.size.width * 0.80;
    final ratio = 0.22 + ((baseWidth / AppDimensions.size.width) * 0.6);
    if (baseWidth > safeBaseWidth) {
      baseWidth = safeBaseWidth;
    } else {
      restaurantCardFraction = ratio;
    }

    restaurantContainerHeight = baseWidth * 0.6;

    double safeBaseHeight = AppDimensions.size.height * 0.75;
    if (restaurantContainerHeight > safeBaseHeight) {
      restaurantContainerHeight = safeBaseHeight * 0.9;
      baseWidth = safeBaseHeight * 1.4;
    }
  }
}
