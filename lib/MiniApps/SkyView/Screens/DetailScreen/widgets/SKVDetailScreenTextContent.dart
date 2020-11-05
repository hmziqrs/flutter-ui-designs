import 'package:flutter/material.dart';
import 'package:flutter_uis/configs/App.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../../../configs/theme.dart' as theme;
import 'SKVDetailScreenAnimatedText.dart';
import '../../../models/SKVObject.dart';
import 'SKVDetailScreenAttribute.dart';
import '../messages/keys.dart';

class SKVDetailScreenTextContent extends StatelessWidget {
  SKVDetailScreenTextContent({
    @required this.pageRendered,
    @required this.item,
  });

  final bool pageRendered;
  final SKVObject item;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: AppDimensions.padding * 2,
                left: AppDimensions.padding * 2,
                right: AppDimensions.padding * 2,
              ),
              child: SKVDetailScreenAnimatedText(
                pageRendered: this.pageRendered,
                index: 0,
                child: Text(
                  this.item.name,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.padding * 2,
              ),
              child: SKVDetailScreenAnimatedText(
                pageRendered: this.pageRendered,
                index: 1,
                child: Text(
                  App.translate(this.item.nickname),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.padding * 2,
              ),
              child: SKVDetailScreenAnimatedText(
                pageRendered: this.pageRendered,
                index: 2,
                child: Text(
                  this.item.distanceInKm,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: theme.primary,
                  ),
                ),
              ),
            ),
            SKVDetailScreenAnimatedText(
              pageRendered: this.pageRendered,
              index: 3,
              child: Container(
                margin: EdgeInsets.only(
                  top: AppDimensions.padding,
                  left: AppDimensions.padding * 2,
                  right: AppDimensions.padding * 2,
                ),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(),
            ),
            SKVDetailScreenAnimatedText(
              pageRendered: this.pageRendered,
              index: 4,
              child: SKVDetailScreenAttribute(
                label: App.translate(SKVDetailScreenMessages.distanceFromSun),
                prefix: "km",
                text: this.item.distanceFromSun,
                icon: MaterialCommunityIcons.arrow_expand,
              ),
            ),
            SKVDetailScreenAnimatedText(
              pageRendered: this.pageRendered,
              index: 5,
              child: SKVDetailScreenAttribute(
                label: App.translate(SKVDetailScreenMessages.oneWayTimeSun),
                prefix: "min",
                text: this.item.lightTimeFromSun,
                icon: MaterialCommunityIcons.weather_sunny,
              ),
            ),
            SKVDetailScreenAnimatedText(
              pageRendered: this.pageRendered,
              index: 6,
              child: SKVDetailScreenAttribute(
                label: App.translate(SKVDetailScreenMessages.lengthYear),
                prefix: App.translate(SKVDetailScreenMessages.earthDays),
                text: this.item.lengthOfYears,
                icon: MaterialCommunityIcons.moon_waning_crescent,
              ),
            ),
            Container(height: AppDimensions.padding * 1),
          ],
        ),
      ),
    );
  }
}
