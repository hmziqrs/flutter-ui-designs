import 'package:flutter/material.dart';

import 'package:flutter_uis/UI.dart';

class HFDDimensions {
  // HomeScreen
  static double chipsHolderWidth;
  static double cardHeight;
  static double categoriesHolderWidth;

  // ItemDetailScreen
  static double backgroundImageHeight;
  static double contentSpace;
  static double contentRightPadding = 0;
  static double statsTopScrollPadding;
  static double statsBottomScrollPadding;
  static double statsLeftPadding = 0;

  static init(BuildContext context, Orientation orientation) {
    final size = MediaQuery.of(context).size;
    final bool isLandscape = Orientation.landscape == orientation;

    // HomeScreen
    chipsHolderWidth = size.width;
    cardHeight = (UI.horizontal * 40) + UI.vertical * 25;

    // ItemDetailScreen
    backgroundImageHeight = UI.vertical * 68;
    contentSpace = size.height * 0.3;
    statsTopScrollPadding = contentSpace * 1.06;
    statsBottomScrollPadding = contentSpace * 0.0;

    if (isLandscape) {
      // HomeScreen
      cardHeight = (UI.horizontal * 30) + UI.vertical * 25;

      // ItemDetail
      backgroundImageHeight = size.height;
      contentSpace = size.height * .4;
    }

    if (UI.isTablet) {
      // HomeScreen
      chipsHolderWidth = size.width * 0.5;
      cardHeight = cardHeight * 0.6;
      categoriesHolderWidth = size.width * 0.5;

      // ItemDetail
      backgroundImageHeight = size.height;
      contentSpace = size.height * 0.5;
      contentRightPadding = size.width * 0.5;
      statsTopScrollPadding = 0;
      statsBottomScrollPadding = 0;
      statsLeftPadding = size.width * 0.5;

      if (Orientation.landscape == orientation) {
        // HomeScreen
        chipsHolderWidth = chipsHolderWidth * 0.7;
        categoriesHolderWidth = categoriesHolderWidth * 0.7;
      }
    }
  }
}
