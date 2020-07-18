import 'package:flutter/material.dart';

class SKVHomeScreenStarFieldPainter extends CustomPainter {
  SKVHomeScreenStarFieldPainter(this.stars);
  final List<Star> stars;

  @override
  void paint(Canvas canvas, Size size) {
    this.stars.forEach((star) {
      double offsetX = star.x;
      double offsetY = star.y;
      double size = star.size;
      Paint paint = Paint();
      paint..color = star.color;

      canvas.drawCircle(Offset(offsetX, offsetY), size, paint);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class Star {
  double x;
  double y;
  double z;
  double size = 1.0;
  Color color = Colors.red;

  Star({this.x = 0, this.y = 0, this.z = 0});
}
