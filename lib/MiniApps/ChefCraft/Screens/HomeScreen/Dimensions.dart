import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/App.dart';

class Dimensions {
  static double smallBox;
  static double largeBox;

  static init(BuildContext context) {
    App.init(context);

    smallBox = 50 + (AppDimensions.ratio * 50);
    largeBox = 100 + (AppDimensions.ratio * 100);
  }
}
