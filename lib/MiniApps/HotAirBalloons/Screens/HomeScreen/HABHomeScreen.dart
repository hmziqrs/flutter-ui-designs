import 'package:flutter/material.dart';
import 'package:tinycolor/tinycolor.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/App.dart';

import 'package:flutter_uis/widgets/Screen/Screen.dart';

import 'widgets/HABHomeScreenBaloonAnimationWrapper.dart';
import 'widgets/HABHomeScreenFlightsCarousel.dart';
import '../../configs/theme.dart' as theme;
import 'messages/keys.dart';
import 'Dimensions.dart';

class HABHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    const fontFamily = 'Montserrat';
    final fontStyle = Theme.of(context).textTheme.bodyText1.copyWith(
          fontFamily: fontFamily,
        );

    final rootTheme = Theme.of(context).copyWith(
      primaryColor: theme.primary,
      accentColor: theme.primary,
    );

    return Screen(
      fontFamily: fontFamily,
      theme: rootTheme,
      textStyle: fontStyle,
      scaffoldBackgroundColor: theme.primary,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // Shapes Background
          Positioned(
            child: Transform(
              transform: Dimensions.shapeTransform,
              child: Image.asset(
                "assets/ma-hab/bubbles-bg.png",
                color: App.isDark()
                    ? TinyColor(Colors.black).lighten(15).color
                    : null,
              ),
            ),
          ),
          // Balloon Shadow Background
          Positioned(
            top: Dimensions.balloonShadowOffset.dy,
            right: Dimensions.balloonShadowOffset.dx,
            child: HABHomeScreenBaloonAnimationWrapper(
              imagePath: "assets/ma-hab/balloon-shadow.png",
              imageSize: Dimensions.balloonShadowSize,
              opacity: 0.3,
            ),
          ),
          // Balloon Background
          Positioned(
            top: Dimensions.balloonOffset.dy,
            right: Dimensions.balloonOffset.dx,
            child: HABHomeScreenBaloonAnimationWrapper(
              imagePath: "assets/ma-hab/balloon.png",
              imageSize: Dimensions.balloonSize,
              opacity: 1.0,
            ),
          ),
          // Content
          Positioned.fill(
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: AppDimensions.padding * 2),
                    child: Text(
                      App.translate(
                        HABHomeScreenMessages.title,
                        context,
                      ),
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: AppDimensions.padding * 2,
                      top: AppDimensions.padding,
                      bottom: AppDimensions.padding,
                    ),
                    child: Text(
                      App.translate(
                        HABHomeScreenMessages.subTitle,
                        context,
                      ),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  HABHomeScreenFlightsCarousel(fontStyle),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
