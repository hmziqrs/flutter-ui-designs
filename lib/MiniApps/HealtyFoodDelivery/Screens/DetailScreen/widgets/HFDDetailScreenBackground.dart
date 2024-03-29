import 'package:flutter/material.dart';


import '../../../models/HFDFoodItem.dart';
import '../Dimensions.dart';
import '../Provider.dart';

class HFDDetailScreenBackground extends StatelessWidget {
  HFDDetailScreenBackground({required this.item});

  final HFDFoodItem item;

  @override
  Widget build(BuildContext context) {
    final state = HFDDetailState.state(context, true);
    var offset = state.offset * 0.22;
    double height = Dimensions.coverImageHeight;
    var scale = 1 + (offset.abs() * 0.008);
    var translateY = offset * 2;
    if (state.offset > 0) {
      scale = 1.0;
      translateY = offset * 1.8;
    }

    print("SS ${state.offset} $scale");

    return SizedBox(
      height: height,
      child: Transform.translate(
        offset: Offset(0, translateY),
        child: Transform.scale(
          scale: scale,
          child: Image.asset(this.item.image, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
