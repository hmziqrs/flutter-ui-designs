import 'package:flutter/material.dart';

class AvatarWithPunchHoleClipper extends CustomClipper<Path> {
  AvatarWithPunchHoleClipper({
    @required this.holeRadius,
    @required this.position,
  });
  final double holeRadius;
  final String position;

  @override
  Path getClip(Size size) {
    final x = size.width / 2;
    final xRadius = holeRadius / 2;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(x - xRadius, 0.0);
    if (position == "top") {
      path
        ..arcToPoint(
          Offset(x + xRadius, 0.0),
          clockwise: false,
          radius: Radius.circular(1),
        );
    }
    path
      ..lineTo(size.width, 0.0)
      ..lineTo(size.width, size.height)
      ..lineTo(x + xRadius, size.height);
    if (position == "bottom") {
      path
        ..arcToPoint(
          Offset(x - xRadius, size.height),
          clockwise: false,
          radius: Radius.circular(1),
        );
    }

    path.lineTo(0.0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(AvatarWithPunchHoleClipper oldClipper) => true;
}
