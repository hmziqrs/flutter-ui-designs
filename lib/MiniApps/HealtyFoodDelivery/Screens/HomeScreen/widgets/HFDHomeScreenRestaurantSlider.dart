import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';

import '../data.dart' as data;
import '../Dimensions.dart';
import '../TestKeys.dart';

import 'HFDHomeScreenRestaurantCard.dart';

class HFDHomeScreenRestaurantSlider extends StatefulWidget {
  HFDHomeScreenRestaurantSlider({Key? key}) : super(key: key);

  @override
  _HFDHomeScreenRestaurantSliderState createState() =>
      _HFDHomeScreenRestaurantSliderState();
}

class _HFDHomeScreenRestaurantSliderState
    extends State<HFDHomeScreenRestaurantSlider> {

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
    return Container(
      margin: EdgeInsets.only(
        top: AppDimensions.padding * 2,
        bottom: AppDimensions.padding * 4,
      ),
      height: Dimensions.restaurantContainerHeight,
      child: CarouselSlider.builder(
        options: CarouselOptions(
          padEnds: false,
          height: Dimensions.restaurantContainerHeight,
          pageSnapping: true,
          disableCenter: true,
          enableInfiniteScroll: false,
          scrollPhysics: const ClampingScrollPhysics(),
          viewportFraction: Dimensions.restaurantCardFraction,
        ),
        itemCount: data.restaurants.length,
        key: Key(HFDHomeScreenTestKeys.restaurantScroll),
        itemBuilder: (ctx, index, _) {
          final restaurant = data.restaurants[index];
          return HFDHomeScreenRestaurantCard(restaurant);
        },
      ),
    );
  }
}
