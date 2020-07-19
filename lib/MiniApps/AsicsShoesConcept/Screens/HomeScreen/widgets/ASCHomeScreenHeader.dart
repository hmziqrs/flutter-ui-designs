import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/Utils.dart';

import '../../../ models/ASCItem.dart';
import '../Dimensions.dart';

class ASCHomeScreenHeader extends StatelessWidget {
  ASCHomeScreenHeader({
    @required this.item,
    @required this.parallax,
  });

  final ASCItem item;
  final double parallax;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      height: Dimensions.headerHeight,
      padding: EdgeInsets.all(AppDimensions.padding * 2),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            this.item.colors[0],
            this.item.colors[1],
            this.item.colors[2]
          ].reversed.toList(),
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Container(
        width: AppDimensions.maxContainerWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Utils.safePadding(context, "top"),
            Container(
              height: Dimensions.logoHeight,
              margin: EdgeInsets.only(left: AppDimensions.padding * 1),
              child: Image.asset(this.item.logoLink),
            ),
            Container(
              margin: EdgeInsets.only(
                top: AppDimensions.padding * 1,
                left: AppDimensions.padding * 2,
              ),
              transform: Matrix4.identity()..translate(this.parallax * -0.9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    this.item.headerHeading,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 8 + AppDimensions.ratio * 8,
                    ),
                  ),
                  Container(height: AppDimensions.padding * 1),
                  Text(
                    this.item.headerDescription,
                    maxLines: 3,
                    style: TextStyle(
                      color: Colors.white,
                      // fontSize: 7 + AppDimensions.ratio * 4,
                      fontSize: 5 + AppDimensions.ratio * 5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
