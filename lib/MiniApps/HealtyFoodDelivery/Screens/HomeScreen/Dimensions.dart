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
  static late double restaurantCardBaseWidth;
  // static late double chipsContainerWidth;

  static init(BuildContext context) {
    App.init(context);

    chipsContainerWidth = 480;

    initItemSize();

    categoryBaseSize = 30 + AppDimensions.ratio * 15;

    initRestaurantsize();
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

  static initRestaurantsize() {
    restaurantCardBaseWidth = 250 + AppDimensions.ratio * 100;

    double safeBaseWidth = AppDimensions.size.width * 0.80;
    if (restaurantCardBaseWidth > safeBaseWidth) {
      restaurantCardBaseWidth = safeBaseWidth;
    }

    restaurantContainerHeight = restaurantCardBaseWidth * 0.6;

    double safeBaseHeight = AppDimensions.size.height * 0.75;
    if (restaurantContainerHeight > safeBaseHeight) {
      restaurantContainerHeight = safeBaseHeight * 0.9;
      restaurantCardBaseWidth = safeBaseHeight * 1.4;
    }
  }
}
