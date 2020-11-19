import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/AppTheme.dart';

class ETCHomeScreenTickPainter extends CustomPainter {
  ETCHomeScreenTickPainter({
    this.tickCount,
    this.ticksPerSection,
    this.tickInset = 0.0,
  })  : tickPaint = Paint(),
        textPaint = TextPainter(
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
        ),
        textStyle = TextStyle(
          color: AppTheme.text,
          fontFamily: 'BebasNeue',
          fontSize: 10 + AppDimensions.ratio * 5,
        ) {
    tickPaint.color = AppTheme.text;
    tickPaint.strokeWidth = 2.0;
  }

  final tickCount;
  final ticksPerSection;
  final tickInset;
  Paint tickPaint;
  TextPainter textPaint;
  TextStyle textStyle;

  final LONG_TICK = AppDimensions.ratio * 9;
  final SHORT_TICK = AppDimensions.ratio * 3;

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width * 0.5;

    canvas.translate(radius, radius);

    for (var i = 0; i < tickCount; ++i) {
      bool isLongTick = i % ticksPerSection == 0;
      final tickLength = isLongTick ? LONG_TICK : SHORT_TICK;

      canvas.drawLine(
        Offset(0.0, -radius),
        Offset(0.0, -radius - tickLength),
        tickPaint,
      );

      if (isLongTick) {
        canvas.save();
        canvas.translate(0.0, -radius - AppDimensions.padding * 6.2);

        textPaint.text = TextSpan(text: '$i', style: textStyle);
        textPaint.layout();

        final tickPercent = i / tickCount;
        var quadrant;

        if (tickPercent < 0.25) {
          quadrant = 1;
        } else if (tickPercent < 0.50) {
          quadrant = 4;
        } else if (tickPercent < 0.75) {
          quadrant = 3;
        } else {
          quadrant = 2;
        }

        switch (quadrant) {
          case 4:
            canvas.rotate(-math.pi / 2);
            break;
          case 2:
          case 3:
            canvas.rotate(math.pi / 2);
            break;
        }

        textPaint.paint(
          canvas,
          Offset(-textPaint.width / 2, -textPaint.height / 2),
        );

        canvas.restore();
      }
      canvas.rotate(2 * math.pi / tickCount);
    }
  }

  @override
  bool shouldRepaint(ETCHomeScreenTickPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(ETCHomeScreenTickPainter oldDelegate) => true;
}
