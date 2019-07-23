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

final topResturants = [
  new Resturant("Top Resturant 1"),
  new Resturant("Top Resturant 2"),
  new Resturant("Top Resturant 3"),
];

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

final items = [
  new FoodItem(
    name: "Eggvacado Salad",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
    stars: 4.5,
    location: 1.2,
    price: 25,
    kcal: 387,
    dailyCal: 20,
    carbo: 23,
    protien: 27,
    fat: 30,
    image: "assets/ma-hfd/item-1.jpg",
  ),
  new FoodItem(
    name: "Eggvacado Salad",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
    stars: 4.5,
    location: 1.2,
    price: 16,
    kcal: 387,
    dailyCal: 20,
    carbo: 23,
    protien: 27,
    fat: 30,
    image: "assets/ma-hfd/item-2.jpg",
  ),
  new FoodItem(
    name: "Eggvacado Salad",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
    stars: 4.5,
    location: 1.2,
    price: 9.99,
    kcal: 387,
    dailyCal: 20,
    carbo: 23,
    protien: 27,
    fat: 30,
    image: "assets/ma-hfd/item-3.jpg",
  )
];
