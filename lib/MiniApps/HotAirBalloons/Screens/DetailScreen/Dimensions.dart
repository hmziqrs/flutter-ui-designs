import 'package:flutter/material.dart';

import 'package:flutter_uis/UI.dart';
import 'package:flutter_uis/configs/App.dart';
import 'package:flutter_uis/configs/AppDimensions.dart';

class Dimensions {
  static double borderCliping;
  static double backgroudImageHeight;
  static int noOfImages = 1;

  static init(BuildContext context) {
    App.init(context);

    backgroudImageHeight = 100 + AppDimensions.ratio * 80;
    borderCliping = 30.0;

    if (UI.width > UI.height) {
      backgroudImageHeight = 80 + AppDimensions.ratio * 60;
    }

    if (UI.md) {
      noOfImages = 2;
    }
    if (UI.xlg) {
      noOfImages = 3;
    }
  }
}
