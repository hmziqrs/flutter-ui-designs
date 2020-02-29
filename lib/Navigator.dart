import 'package:flutter/material.dart';
// import 'package:firebase/firebase.dart' as firebase;

import './configs/Theme.dart' as theme;
import 'package:flutter_uis/io/io.dart';

import './screens/Home/Home.dart';
import './screens/Download/Download.dart';
import './screens/AboutApp/AboutApp.dart';
import './screens/AboutDeveloper/AboutDeveloper.dart';
import './screens/UiList/UiList.dart';
import './screens/UiDetail/UIDetail.dart';
import './screens/DesignerProfile/DesignerProfile.dart';

import './MiniApps/HealtyFoodDelivery/Screens/HomeScreen/HFDHomeScreen.dart';
import './MiniApps/HealtyFoodDelivery/Screens/DetailScreen/HFDDetailScreen.dart';

import './MiniApps/HotAirBalloons/Screens/HomeScreen/HABHomeScreen.dart';
// import './MiniApps/HotAirBalloons/Screens/DetailScreen/HABDetailScreen.dart';

import './MiniApps/SkyView/Screens/HomeScreen/SKHomeScreen.dart';

import 'package:flutter_uis/MiniApps/AsicsShoesConcept/Screens/HomeScreen/ASCHomeScreen.dart';
// import './MiniApps/SkyView/Screens/DetailScreen/SKDetailScreen.dart';

bool isAlt = false;

class AppNavigator extends StatelessWidget {
  AppNavigator(this.observers);
  final List<NavigatorObserver> observers;
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
        debugShowCheckedModeBanner: false,
        navigatorKey: this.navigator,
        theme: ThemeData(
          fontFamily: "Muli",
          primaryColor: theme.primary,
          accentColor: theme.primary,
        ),
        navigatorObservers: observers,
        home: HomeScreen(),
        onGenerateRoute: (settings) {
          if (settings.name == "hfdDetail") {
            return PageRouteBuilder(
              settings: RouteSettings(arguments: settings.arguments),
              pageBuilder: (_, __, ___) => HFDDetailScreen(),
              transitionsBuilder: (_, anim, __, child) {
                return FadeTransition(opacity: anim, child: child);
              },
            );
          }
          // unknown route
          return MaterialPageRoute(builder: (context) => HomeScreen());
        },
        routes: <String, WidgetBuilder>{
          "home": (ctx) => new HomeScreen(),
          "about": (ctx) => new AboutAppScreen(),
          "aboutDeveloper": (ctx) => new AboutDeveloperScreen(),
          "download": (ctx) => new DownloadScreen(),
          "uiList": (ctx) => new UiListScreen(),
          "uiDetail": (ctx) => new UiDetailScreen(),
          "designerProfile": (ctx) => new DesignerProfileScreen(),

          // Healthy Food Delivery
          "hfdHome": (ctx) => new HFDHomeScreen(),
          // "hfdDetail": (ctx) => new HFDDetailScreen(),

          // Hot Air Balloon
          "habHome": (ctx) => new HABHomeScreen(),

          // Sky View
          "skHome": (ctx) => new SKHomeScreen(),
          // "skDetail": (ctx) => new SKDetailScreen(),

          "ascHome": (ctx) => new ASCHomeScreen(),
        },
      ),
    );
  }
}
