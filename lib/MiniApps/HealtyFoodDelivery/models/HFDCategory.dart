import 'package:flutter/material.dart';

class HFDCategory {
  HFDCategory(
    this.name,
    this.icon, {
    this.margin = const EdgeInsets.all(0.0),
    this.iconSize = 24,
  });

  String name;
  IconData icon;
  EdgeInsets margin;
  double iconSize;
}
