import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:pigment/pigment.dart';

import '../Dimensions.dart';

import 'SKVHomeScreenStarFieldPainter.dart';

class SKVHomeScreenStarField extends StatefulWidget {
  final double scrollX;
  final double scrollY;

  SKVHomeScreenStarField({
    this.scrollX = 0.0,
    this.scrollY = 0.0,
    Key? key,
  }) : super(key: key);

  @override
  _SKVHomeScreenStarFieldState createState() => _SKVHomeScreenStarFieldState();
}

class _SKVHomeScreenStarFieldState extends State<SKVHomeScreenStarField> {
  final Map<int, Color> colorMap = {
    1: Pigment.fromString("#f00"),
    4: Pigment.fromString("#9400D3"),
    8: Pigment.fromString("#00b"),
  };
  late List<Star> stars;

  @override
  void initState() {
    final noOfStars =
        (Dimensions.carouselCardWidth + Dimensions.carouselHeight);
    this.stars = List.generate(
      noOfStars ~/ 12,
      (index) => this.generateRandom(
        Star(),
      ),
    );

    super.initState();
  }

  Star generateRandom(Star star, [bool moving = false]) {
    final rand = math.Random();
    final maxX = Dimensions.carouselCardWidth;
    final maxY = Dimensions.carouselHeight;

    final speedX = widget.scrollX;
    final speedY = widget.scrollY;

    if (moving) {
      star.x = star.x + (speedX + (speedX * star.size * 2)).clamp(-15.0, 15.0);
      star.y = star.y + (speedY + (speedY * star.size * 2)).clamp(-15.0, 15.0);
    } else {
      star.x = rand.nextDouble() * maxX;
      star.y = rand.nextDouble() * maxY;
      star.color = this.colorMap[rand.nextInt(12)] ?? Colors.white;
      star.size = rand.nextDouble() * 1.5 + 0.3;
    }

    if (star.x > maxX) {
      star.x = rand.nextDouble() * maxX * 0.08;
      star.y = rand.nextDouble() * maxY;
    }
    if (star.x < 0) {
      star.x = rand.nextDouble() + maxX * 0.92;
      star.y = rand.nextDouble() * maxY;
    }
    if (star.y > maxY) {
      star.x = rand.nextDouble() * maxX;
      star.y = rand.nextDouble() * maxY * 0.15;
    }
    if (star.y < 0) {
      star.x = rand.nextDouble() * maxX;
      star.y = rand.nextDouble() + maxY * 0.85;
    }

    return star;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: SKVHomeScreenStarFieldPainter(
          this
              .stars
              .map(
                (star) => this.generateRandom(star, true),
              )
              .toList(),
        ),
      ),
    );
  }
}
