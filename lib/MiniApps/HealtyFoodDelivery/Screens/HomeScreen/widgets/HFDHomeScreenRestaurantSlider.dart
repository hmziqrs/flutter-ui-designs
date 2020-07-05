import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';

import '../data.dart' as data;

import 'HFDHomeScreenRestaurantCard.dart';
import '../Dimensions.dart';

class HFDHomeScreenRestaurantSlider extends StatefulWidget {
  HFDHomeScreenRestaurantSlider({Key key}) : super(key: key);

  @override
  _HFDHomeScreenRestaurantSliderState createState() =>
      _HFDHomeScreenRestaurantSliderState();
}

class _HFDHomeScreenRestaurantSliderState
    extends State<HFDHomeScreenRestaurantSlider> with AnimationControllerMixin {
  PageController pageController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    this.pageController = PageController(
      viewportFraction:
          Dimensions.restaurantCardBaseWidth / AppDimensions.size.width,
    );
    return Container(
      margin: EdgeInsets.only(
        top: AppDimensions.padding * 2,
        bottom: AppDimensions.padding * 4,
      ),
      height: Dimensions.restaurantContainerHeight,
      child: PageView.builder(
        controller: this.pageController,
        scrollDirection: Axis.horizontal,
        itemCount: data.restaurants.length,
        itemBuilder: (ctx, index) {
          final restaurant = data.restaurants[index];
          return HFDHomeScreenRestaurantCard(restaurant);
        },
      ),
    );
  }
}
