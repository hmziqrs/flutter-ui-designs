import 'package:flutter/material.dart';

import 'package:flutter_uis/UI.dart';
import 'package:flutter_uis/configs/App.dart';

class Dimensions {
  static double headerSpace;
  static double backgroudImageHeight;

  static init(
    BuildContext context, {
    Orientation orientation = Orientation.portrait,
  }) {
    App.init(context);
    final bool isLandscape = Orientation.landscape == orientation;

    headerSpace = UI.vertical * 6;
    backgroudImageHeight = UI.vertical * 30;

    if (isLandscape) {
      headerSpace = UI.vertical * 4;
      backgroudImageHeight = UI.vertical * 60;
    }

    if (UI.isTablet) {
      if (isLandscape) {
        backgroudImageHeight = UI.vertical * 70;
      }
    }
  }
}
