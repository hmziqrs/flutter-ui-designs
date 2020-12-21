import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../Dimensions.dart';
import '../TestKeys.dart';

import 'ETCHomeScreenArrowPainter.dart';
import 'ETCHomeScreenTickPainter.dart';

class ETCHomeScreenTimerDial extends StatefulWidget {
  ETCHomeScreenTimerDial(
    this.gradient, {
    this.ticksPerSection,
    this.maxTime,
    this.currentTime,
  });
  final LinearGradient gradient;
  final Duration currentTime;
  final Duration maxTime;
  final int ticksPerSection;

  @override
  _ETCHomeScreenTimerDialState createState() => _ETCHomeScreenTimerDialState();
}

class _ETCHomeScreenTimerDialState extends State<ETCHomeScreenTimerDial> {
  double rotationPercent() =>
      this.widget.currentTime.inSeconds / this.widget.maxTime.inSeconds;

  @override
  Widget build(BuildContext context) {
    final boxShadow = BoxShadow(
      color: Colors.black.withOpacity(0.18),
      blurRadius: AppDimensions.ratio * 2,
      offset: Offset(0.0, AppDimensions.ratio * 1),
    );

    return Container(
      key: Key(ETCHomeScreenTestKeys.radiusBase),
      width: Dimensions.radius,
      height: Dimensions.radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: this.widget.gradient,
        boxShadow: [boxShadow],
      ),
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.all(AppDimensions.padding * 13),
            child: CustomPaint(
              painter: ETCHomeScreenTickPainter(
                tickCount: this.widget.maxTime.inMinutes,
                ticksPerSection: this.widget.ticksPerSection,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(AppDimensions.padding * 16),
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Container(
                  child: CustomPaint(
                    painter: ETCHomeScreenArrowPainter(
                      rotationPercent: this.rotationPercent(),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(AppDimensions.padding * 3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: this.widget.gradient,
                    boxShadow: [boxShadow],
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 2,
                        color: Colors.black.withOpacity(0.04),
                      ),
                    ),
                    child: Center(
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationZ(
                          2 * math.pi * this.rotationPercent(),
                        ),
                        child: Icon(
                          MaterialCommunityIcons.infinity,
                          size: 30 + AppDimensions.ratio * 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
