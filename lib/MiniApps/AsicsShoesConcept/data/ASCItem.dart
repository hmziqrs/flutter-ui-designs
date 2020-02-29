import 'package:flutter/material.dart';

class ASCItem {
  final String logoLink;
  final String shoeImage;
  final String headerHeading;
  final String headerDescription;
  final String contentHeading;
  final String contentSubHeading;
  final String contentBadge;
  final List<Color> colors;
  final double stars;
  final double price;

  ASCItem({
    this.logoLink,
    this.shoeImage,
    this.headerHeading,
    this.headerDescription,
    this.contentHeading,
    this.contentSubHeading,
    this.contentBadge,
    this.colors,
    this.stars,
    this.price,
  });
}
