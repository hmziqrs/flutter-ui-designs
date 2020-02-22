import 'package:flutter/material.dart';
import 'package:flutter_uis/UI.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';

class Dimensions {
  static double buttonWidth;

  static init(BuildContext context) {
    AppDimensions.init(context);
    buttonWidth = double.infinity;

    if (UI.sm) {
      buttonWidth = 200;
    }
  }
}
