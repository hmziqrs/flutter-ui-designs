import 'package:flutter/material.dart';
import 'package:universal_io/io.dart';
// import 'package:firebase_analytics/observer.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';

import './configs/Theme.dart' as theme;
// import 'Utils.dart';

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

bool isAlt = false;

class AppNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigator = new GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      autofocus: true,
      focusNode: FocusNode(),
      onKey: (RawKeyEvent event) {
        final runtime = event.runtimeType.toString();
        final keyName = event.logicalKey.debugName;
        final ctrl = "Unknown Android key code 17";

        if (Platform.isWindows && keyName == ctrl) {
          isAlt = (runtime == 'RawKeyDownEvent');
        }

        // print(
        //     "runtime:${event.runtimeType} | keyName:${event.logicalKey.debugName} | alt:${event.isAltPressed}");
        if (runtime == 'RawKeyUpEvent' &&
            (keyName == 'Backspace' || keyName == 'Digit 1') &&
            (event.isAltPressed || isAlt) &&
            this.navigator.currentState.canPop()) {
          this.navigator.currentState.pop();
        }
      },
      child: MaterialApp(
        navigatorKey: this.navigator,
        theme: ThemeData(
          fontFamily: "Muli",
          primaryColor: theme.primary,
          accentColor: theme.primary,
        ),
        navigatorObservers: [
          // FirebaseAnalyticsObserver(analytics: analytics),
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
      ),
    );
  }
}
