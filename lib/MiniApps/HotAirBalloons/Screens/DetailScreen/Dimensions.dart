import 'package:flutter/material.dart';

import 'package:flutter_uis/UI.dart';
import 'package:flutter_uis/configs/App.dart';
import 'package:flutter_uis/configs/AppDimensions.dart';

class Dimensions {
  static late double borderClipping;
  static late double backgroundImageHeight;
  static int noOfImages = 1;

  static init(BuildContext context) {
    App.init(context);

    backgroundImageHeight = 100 + AppDimensions.ratio * 80;
    borderClipping = 30.0;

    if (UI.width > UI.height) {
      backgroundImageHeight = 80 + AppDimensions.ratio * 60;
    }

    if (UI.md) {
      noOfImages = 2;
    }
    if (UI.xlg) {
      noOfImages = 3;
    }
  }
}
