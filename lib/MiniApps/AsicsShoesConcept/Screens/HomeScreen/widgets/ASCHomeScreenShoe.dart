import 'package:flutter/material.dart';
import 'package:flutter_uis/MiniApps/AsicsShoesConcept/Screens/HomeScreen/Provider.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';

import '../../../models/ASCItem.dart';
import '../Dimensions.dart';

class ASCHomeScreenShoe extends StatefulWidget {
  ASCHomeScreenShoe({
    required this.item,
    required this.uiParallax,
  });

  final ASCItem item;
  final double uiParallax;

  @override
  _ASCHomeScreenShoeState createState() => _ASCHomeScreenShoeState();
}

class _ASCHomeScreenShoeState extends State<ASCHomeScreenShoe>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      const SCALE_FACTOR = 0.5;
      final state = ASCShoeProvider.state(context);

      state.shoesController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 800),
        reverseDuration: Duration(milliseconds: 800),
      )..addListener(
          () {
            setState(() {});
          },
        );

      state.shoeAnimation = Tween(begin: 0.0, end: SCALE_FACTOR).animate(
        CurvedAnimation(
          curve: Curves.elasticOut,
          parent: ASCShoeProvider.state(context).shoesController,
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = Dimensions.shoeWidth;
    double height = Dimensions.shoeHeight;

    final scale = this.widget.uiParallax * -0.12;
    final opacity = this.widget.uiParallax * 0.15;
    final state = ASCShoeProvider.state(context);
    final sizeScale = state.shoeAnimation?.value ?? 0;
    return Positioned(
      top: Dimensions.shoeTop,
      // left: (AppDimensions.size.width / 2) - width * 0.4,
      left: (AppDimensions.size.width / 2) - width * 0.45,
      child: Transform(
        transform: Matrix4.identity()
          ..rotateZ((24 + (this.widget.uiParallax * 15)) * 3.1415927 / 180)
          ..scale(1 + scale + sizeScale, 1 + scale + sizeScale)
          ..translate(this.widget.uiParallax * -35),
        alignment: FractionalOffset.center,
        child: Opacity(
          opacity: (1 - opacity).clamp(0.0, 1.0),
          child: Container(
            width: width,
            height: height,
            // color: Colors.red,
            alignment: Alignment.center,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Positioned(
                  bottom: Dimensions.shoeHeight * 0.08,
                  left: AppDimensions.ratio * 10,
                  right: AppDimensions.ratio * 10,
                  child: Container(
                    height: AppDimensions.ratio * 1,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 30,
                          spreadRadius: 16,
                          color: Colors.black.withOpacity(0.55),
                        )
                      ],
                    ),
                  ),
                ),
                Container(child: Image.asset(this.widget.item.shoeImage)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
