import 'package:flutter/material.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

import './configs/Theme.dart' as theme;

import './screens/Home/Home.dart';
import './screens/AboutApp/AboutApp.dart';
import './screens/AboutDesigner/AboutDesigner.dart';
import './screens/UiList/UiList.dart';
import './screens/UiDetail/UIDetail.dart';
import './screens/DesignerProfile/DesignerProfile.dart';

import './MiniApps/HealtyFoodDelivery/HomeScreen.dart';
import './MiniApps/HealtyFoodDelivery/ItemDetailScreen.dart';

import './MiniApps/HotAirBalloons/Screens/HomeScreen/HABHomeScreen.dart';
// import './MiniApps/HotAirBalloons/Screens/DetailScreen/HABDetailScreen.dart';

import './MiniApps/SkyView/Screens/HomeScreen/SKHomeScreen.dart';
// import './MiniApps/SkyView/Screens/DetailScreen/SKDetailScreen.dart';

class AppNavigator extends StatelessWidget {
  AppNavigator();
  final FirebaseAnalytics analytics = FirebaseAnalytics();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(
        fontFamily: "Muli",
        primaryColor: theme.primary,
        accentColor: theme.primary,
      ),
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
      home: HomeScreen(),
      routes: <String, WidgetBuilder>{
        "home": (ctx) => new HomeScreen(),
        "about": (ctx) => new AboutAppScreen(),
        "aboutDesigner": (ctx) => new AboutDesignerScreen(),
        "uiList": (ctx) => new UiListScreen(),
        "uiDetail": (ctx) => new UiDetailScreen(),
        "designerProfile": (ctx) => new DesignerProfileScreen(),

        // Healthy Food Delivery
        "hfdHome": (ctx) => new HealtyFoodDeliveryHomeScreen(),
        "hfdItemDetail": (ctx) => new HealtyFoodDeliveryItemDetailScreen(),

        // Hot Air Balloon
        "habHome": (ctx) => new HABHomeScreen(),

        // Sky View
        "skHome": (ctx) => new SKHomeScreen(),
        // "skDetail": (ctx) => new SKDetailScreen(),
      },
    );
  }
}
