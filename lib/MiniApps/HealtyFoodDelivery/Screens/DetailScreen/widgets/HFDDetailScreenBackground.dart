import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';

import '../../../models/HFDFoodItem.dart';
import '../Dimensions.dart';

class HFDDetailScreenBackground extends StatelessWidget {
  HFDDetailScreenBackground({required this.offset, required this.item});

  final double offset;
  final HFDFoodItem item;

  @override
  Widget build(BuildContext context) {
    double height = Dimensions.coverImageHeight + (this.offset * -1);

    if (height < 0) {
      height = 0;
    }

    return Container(
      height: height,
      alignment: Alignment.bottomCenter,
      transform: Matrix4.identity()..translate(0.0, this.offset),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage(this.item.image),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10,
          sigmaY: 10,
        ),
        child: Container(
          color: Colors.transparent,
          child: Container(
            width: AppDimensions.miniContainerWidth * 1.1,
            height: double.infinity,
            child: Image.asset(
              this.item.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
