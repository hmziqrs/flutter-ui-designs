import 'package:flutter/material.dart';

class ASCItem {
  final String logoLink;
  final String shoeImage;
  final String headerHeading;
  final String headerDescription;
  final String contentHeading;
  final String contentSubHeading;
  final List<Color> colors;
  final double stars;
  final double price;

  ASCItem({
    required this.logoLink,
    required this.shoeImage,
    required this.headerHeading,
    required this.headerDescription,
    required this.contentHeading,
    required this.contentSubHeading,
    required this.colors,
    required this.stars,
    required this.price,
  });
}
