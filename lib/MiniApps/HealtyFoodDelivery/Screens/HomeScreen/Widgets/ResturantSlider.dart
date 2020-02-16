import 'package:flutter/material.dart';
import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:simple_animations/simple_animations.dart';

import '../../../data/data.dart' as data;

import 'ResturantCard.dart';
import '../Dimensions.dart';

class ResturantSlider extends StatefulWidget {
  ResturantSlider({Key key}) : super(key: key);

  @override
  _ResturantSliderState createState() => _ResturantSliderState();
}

class _ResturantSliderState extends State<ResturantSlider>
    with AnimationControllerMixin {
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
          Dimensions.resturantCardBaseWidth / AppDimensions.size.width,
    );
    return Container(
      height: Dimensions.resturantContainerHeight,
      child: PageView.builder(
        controller: this.pageController,
        scrollDirection: Axis.horizontal,
        itemCount: data.resturants.length,
        itemBuilder: (ctx, index) {
          final resturant = data.resturants[index];
          return ResturantCard(resturant);
        },
      ),
    );
  }
}
