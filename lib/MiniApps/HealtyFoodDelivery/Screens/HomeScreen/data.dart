import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_uis/MiniApps/HealtyFoodDelivery/Screens/HomeScreen/messages/keys.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../../models/HFDRestaurant.dart';
import '../../models/HFDFoodItem.dart';
import '../../models/HFDCategory.dart';

import 'TestKeys.dart';

export '../../models/HFDRestaurant.dart';
export '../../models/HFDFoodItem.dart';
export '../../models/HFDCategory.dart';

final bottomNavList = [
  Icons.home,
  Icons.room,
  Icons.shopping_cart,
  MaterialCommunityIcons.heart,
  MaterialCommunityIcons.account,
];

final restaurants = [
  "Island Grill",
  "Shanghai Dynasty",
  "Divine lunch",
  "Quick Bite",
  "Urban Zest Cafe",
]
    .asMap()
    .entries
    .map(
      (entry) => HFDRestaurant(
        id: entry.key,
        name: entry.value,
        image: "assets/ma-hfd/restaurant-${entry.key + 1}.jpg",
        testKey: HFDHomeScreenTestKeys.restaurant1.replaceFirst(
          "restaurant1",
          "restaurant${entry.key + 1}",
        ),
      ),
    )
    .toList();

final categories = [
  new HFDCategory(
    HFDHomeScreenMessages.breakfast,
    FontAwesome5Solid.bread_slice,
    margin: EdgeInsets.only(right: 3),
  ),
  new HFDCategory(
    HFDHomeScreenMessages.lunch,
    MaterialCommunityIcons.food,
    iconSize: 34,
    margin: EdgeInsets.only(bottom: 4),
  ),
  new HFDCategory(
    HFDHomeScreenMessages.bevrages,
    Entypo.drink,
  ),
  new HFDCategory(
    HFDHomeScreenMessages.snack,
    FontAwesome5Solid.hamburger,
  ),
];

final _description =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s";

final List<HFDFoodItem> items = List.generate(
  9,
  (index) {
    final r = Random();
    return new HFDFoodItem(
      id: index,
      name: "Healthy Food",
      testKey: HFDHomeScreenTestKeys.foodItem1.replaceFirst(
        "Item1",
        "Item${index + 1}",
      ),
      description: "$_description $_description $_description $_description",
      stars: (r.nextInt(5) + r.nextDouble()),
      location: (r.nextInt(32) + r.nextDouble()),
      price: (r.nextInt(100) + r.nextDouble()),
      kcal: r.nextInt(800).toDouble(),
      dailyCal: 10 + r.nextInt(100 - 10),
      carbo: r.nextInt(100),
      protien: r.nextInt(100),
      fat: r.nextInt(100),
      image: "assets/ma-hfd/item-${index + 1}.jpg",
    );
  },
);
