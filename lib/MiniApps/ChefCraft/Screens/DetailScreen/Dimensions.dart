import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/App.dart';

class Dimensions {
  static double coverImage;

  static init(BuildContext context) {
    App.init(context);

    coverImage = 150 + (AppDimensions.ratio * 120);
  }
}
