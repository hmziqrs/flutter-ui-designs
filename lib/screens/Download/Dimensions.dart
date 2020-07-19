import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/App.dart';
import 'package:flutter_uis/UI.dart';

class Dimensions {
  static double buttonWidth;

  static init(BuildContext context) {
    App.init(context);
    buttonWidth = double.infinity;

    if (UI.sm) {
      buttonWidth = 200;
    }
  }
}
