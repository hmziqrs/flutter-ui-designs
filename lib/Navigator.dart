import 'package:flutter/material.dart';

import './screens/Home/Home.dart';
import './screens/UiList/UiList.dart';
import './screens/UiDetail/UIDetail.dart';

import './MiniApps/HealtyFoodDelivery/HomeScreen.dart';
import './MiniApps/HealtyFoodDelivery/ItemDetailScreen.dart';

class AppNavigator extends StatelessWidget {
  AppNavigator();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: HomeScreen(),
      routes: <String, WidgetBuilder>{
        "home": (ctx) => new HomeScreen(),
        "uiList": (ctx) => new UiListScreen(),
        "uiDetail": (ctx) => new UiDetailScreen(),
        "hfdHome": (ctx) => new HealtyFoodDeliveryHomeScreen(),
        "hfdItemDetail": (ctx) => new HealtyFoodDeliveryItemDetailScreen(),
      },
    );
  }
}
