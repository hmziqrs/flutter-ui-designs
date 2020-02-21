import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';

class Dimensions {
  static double coverImageHeight;
  static double contentHeight;

  static init(BuildContext context) {
    AppDimensions.init(context);

    final height = AppDimensions.size.height;
    coverImageHeight = height * 0.60;
    contentHeight = coverImageHeight * 0.50;

    if (height < 980) {
      coverImageHeight = height * 0.75;
      contentHeight = coverImageHeight * 0.55;
    }
    if (height < 800) {
      coverImageHeight = height * 0.80;
      contentHeight = coverImageHeight * 0.60;
    }

    if (height < 650) {
      coverImageHeight = height * 0.85;
      contentHeight = coverImageHeight * 0.65;
    }
    if (height < 500) {
      coverImageHeight = (500);
      contentHeight = coverImageHeight * 0.70;
    }
  }
}
