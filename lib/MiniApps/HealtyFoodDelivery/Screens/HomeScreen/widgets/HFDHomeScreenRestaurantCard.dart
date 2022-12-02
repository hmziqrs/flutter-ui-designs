import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_uis/Mixins/HoverBase.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/utils/Utils.dart';

import '../data.dart' as data;
import '../Dimensions.dart';

class HFDHomeScreenRestaurantCard extends StatefulWidget {
  final data.HFDRestaurant restaurant;
  HFDHomeScreenRestaurantCard(this.restaurant, {Key? key}) : super(key: key);

  @override
  _HFDHomeScreenRestaurantCardState createState() =>
      _HFDHomeScreenRestaurantCardState();
}

class _HFDHomeScreenRestaurantCardState
    extends State<HFDHomeScreenRestaurantCard>
    with SingleTickerProviderStateMixin, HoverWidgetBase {
  @override
  Widget build(BuildContext context) {
    final sigma = Utils.rangeMap(
      this.animation.value,
      0.0,
      1.0,
      2.4,
      0.01,
    );

    return Padding(
      padding: EdgeInsets.all(AppDimensions.padding * 2),
      child: Align(
        child: this.buildInkWell(
          onTap: () {},
          key: Key(this.widget.restaurant.testKey),
          child: Container(
            width: Dimensions.restaurantCardBaseWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(widget.restaurant.image),
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 6,
                  spreadRadius: 2,
                  offset: Offset(0, 2),
                  color: Colors.black.withOpacity(
                    Utils.rangeMap(this.animation.value, 0.0, 1.0, 0.2, 0.6),
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
                      stops: [
                        // 0.3,
                        Utils.rangeMap(
                          this.animation.value,
                          0.0,
                          1.0,
                          0.3,
                          0.4,
                        ),
                        Utils.rangeMap(
                          this.animation.value,
                          0.0,
                          1.0,
                          0.8,
                          1.0,
                        ),
                      ],
                      colors: [
                        Colors.black.withOpacity(0.80),
                        Colors.transparent,
                      ],
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: Utils.rangeMap(
                          this.animation.value,
                          0.0,
                          1.0,
                          AppDimensions.padding,
                          AppDimensions.ratio * 22,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppDimensions.padding * 2,
                          ),
                          child: Text(
                            widget.restaurant.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15 + AppDimensions.ratio * 4,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: Utils.rangeMap(
                          this.animation.value,
                          0.0,
                          1.0,
                          -AppDimensions.ratio * 16,
                          AppDimensions.ratio * 4,
                        ),
                        child: CustomAnimationBuilder(
                          tween: Tween(begin: 0.0, end: 1.0),
                          duration: Duration(milliseconds: 280),
                          control: this.animation.value > 0.5
                              ? Control.play
                              : Control.playReverse,
                          child: Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(
                              horizontal: AppDimensions.padding * 2,
                            ),
                            child: Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
                                    maxLines: 2,
                                    style: TextStyle(
                                      height: 1.26,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white.withOpacity(0.55),
                                      fontSize: 6 + AppDimensions.ratio * 4,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          builder: (context, opacityAnimation, child) {
                            return Opacity(
                              opacity: opacityAnimation,
                              child: child,
                            );
                          },
                        ),
                      ),
                    ],
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
