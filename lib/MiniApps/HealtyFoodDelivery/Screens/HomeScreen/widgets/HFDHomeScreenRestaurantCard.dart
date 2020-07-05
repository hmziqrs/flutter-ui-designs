import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/Utils.dart';

import 'package:flutter_uis/Mixins/HoverWidget.dart';

import '../data.dart' as data;
import '../Dimensions.dart';

class HFDHomeScreenRestaurantCard extends StatefulWidget {
  final data.HFDRestaurant resrutant;
  HFDHomeScreenRestaurantCard(this.resrutant, {Key key}) : super(key: key);

  @override
  _HFDHomeScreenRestaurantCardState createState() =>
      _HFDHomeScreenRestaurantCardState();
}

class _HFDHomeScreenRestaurantCardState
    extends State<HFDHomeScreenRestaurantCard> with HoverWidgetMixin {
  @override
  Widget build(BuildContext context) {
    final sigma = Utils.rangeMap(animation.value, 0.0, 1.0, 2.4, 0);

    return Padding(
      padding: EdgeInsets.all(AppDimensions.padding * 2),
      child: Align(
        child: this.buildInkWell(
          child: Container(
            width: Dimensions.restaurantCardBaseWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              image: DecorationImage(
                image: AssetImage(widget.resrutant.image),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 6,
                  spreadRadius: 2,
                  offset: Offset(0, 2),
                  color: Colors.black.withOpacity(
                    Utils.rangeMap(animation.value, 0.0, 1.0, 0.2, 0.6),
                  ),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      stops: [0.3, 0.8],
                      colors: [
                        Colors.black.withOpacity(0.80),
                        Colors.transparent,
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppDimensions.padding * 2,
                      vertical: AppDimensions.padding,
                    ),
                    child: Text(
                      widget.resrutant.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15 + AppDimensions.ratio * 4,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
