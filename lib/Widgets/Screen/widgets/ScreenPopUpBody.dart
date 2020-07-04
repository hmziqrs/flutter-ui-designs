import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/Utils.dart';

class ScreenPopUpBody extends StatelessWidget {
  ScreenPopUpBody({
    this.mounted,
    this.popUpAnimation,
    this.controller,
    this.onReset,
    this.popUpTitle,
    this.popUpMessage,
  });
  final bool mounted;
  final Animation<double> popUpAnimation;
  final AnimationControllerX controller;
  final VoidCallback onReset;
  final String popUpTitle;
  final String popUpMessage;

  @override
  Widget build(BuildContext context) {
    final margin = AppDimensions.padding * 3;
    final borderRadius = BorderRadius.circular(6.0);

    if (!mounted) {
      return Container();
    }

    return Positioned(
      bottom: Utils.rangeMap(
        popUpAnimation.value,
        0.0,
        1.0,
        -30,
        0.0,
      ),
      right: 0,
      child: Opacity(
        opacity: popUpAnimation.value.clamp(0.0, 1.0),
        child: GestureDetector(
          onTap: () => this.onReset,
          child: Container(
            margin: EdgeInsets.all(margin),
            width: MediaQuery.of(context).size.width - (margin * 2),
            constraints: BoxConstraints(
              maxWidth: 320,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: borderRadius,
              boxShadow: [
                BoxShadow(
                  blurRadius: 6.0,
                  offset: Offset(0.0, 3.0),
                  color: Colors.black.withOpacity(0.3),
                )
              ],
            ),
            child: ClipRRect(
              borderRadius: borderRadius,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(width: 6, color: Colors.red),
                  ),
                ),
                padding: EdgeInsets.all(AppDimensions.padding * 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      popUpTitle ?? "",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14 + AppDimensions.ratio * 7,
                      ),
                    ),
                    Container(
                      height: AppDimensions.padding * .5,
                    ),
                    Text(popUpMessage ?? ""),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
