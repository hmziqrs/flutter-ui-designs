import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import './FoodItem.dart';
import './Category.dart';
import './Resturant.dart';

export './FoodItem.dart';
export './Category.dart';
export './Resturant.dart';

final bottomnavList = [
  Icons.home,
  Icons.room,
  Icons.shopping_cart,
  MaterialCommunityIcons.heart,
  MaterialCommunityIcons.account,
];

const fliters = [
  'Nearby',
  'Recommended',
  'Popular',
];

final resturants = List.generate(
  5,
  (index) => new Resturant(
    id: index,
    name: "Resturant $index",
    image: "assets/ma-hfd/resturant-${index + 1}.jpg",
  ),
);

final categories = [
  new Category(
    "Breakfast",
    FontAwesome5Solid.bread_slice,
    margin: EdgeInsets.only(right: 3),
  ),
  new Category(
    "Lunch",
    MaterialCommunityIcons.food,
    iconSize: 34,
    margin: EdgeInsets.only(bottom: 4),
  ),
  new Category("Bevrages", Entypo.drink),
  new Category("Snack", FontAwesome5Solid.hamburger),
];

final _description =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s";

final List<FoodItem> items = List.generate(
  8,
  (index) {
    final r = Random();
    return new FoodItem(
      id: index,
      name: "Healthy Food",
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
