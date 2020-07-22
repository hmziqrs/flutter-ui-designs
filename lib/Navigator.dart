import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import './configs/Theme.dart' as theme;
import 'package:flutter_uis/io/io.dart';

import 'package:flutter_uis/AppLocalizations.dart';
import 'Providers/AppProvider.dart';

import 'screens/Home/Home.dart';
import 'screens/Download/Download.dart';
import 'screens/AboutApp/AboutApp.dart';
import 'screens/AboutDeveloper/AboutDeveloper.dart';
import 'screens/UIList/UIList.dart';
import 'screens/UIDetail/UIDetail.dart';
import 'screens/DesignerProfile/DesignerProfile.dart';

import 'MiniApps/HealtyFoodDelivery/Screens/HomeScreen/HFDHomeScreen.dart';
import 'MiniApps/HealtyFoodDelivery/Screens/DetailScreen/HFDDetailScreen.dart';

import 'MiniApps/HotAirBalloons/Screens/HomeScreen/HABHomeScreen.dart';
// import './MiniApps/HotAirBalloons/Screens/DetailScreen/HABDetailScreen.dart';

import 'MiniApps/SkyView/Screens/HomeScreen/SKVHomeScreen.dart';
import 'MiniApps/SkyView/Screens/DetailScreen/SKVDetailScreen.dart';

import 'MiniApps/AsicsShoesConcept/Screens/HomeScreen/ASCHomeScreen.dart';

import 'MiniApps/EggTimerConcept/Screens/HomeScreen/ETCHomeScreen.dart';

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
        if (runtime == 'RawKeyUpEvent' &&
            (keyName == 'Backspace' || keyName == 'Digit 1') &&
            (event.isAltPressed || isAlt) &&
            this.navigator.currentState.canPop()) {
          this.navigator.currentState.pop();
        }
      },
      child: ChangeNotifierProvider<AppProvider>(
        create: (_) => AppProvider(),
        child: Consumer<AppProvider>(
          // stream: null,
          builder: (context, value, _) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              locale: value.activeLocale,
              supportedLocales: AppProvider.locales,
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              localeResolutionCallback: (locale, supportedLocales) {
                for (var supportedLocale in supportedLocales) {
                  if (locale != null &&
                      supportedLocale.languageCode == locale.languageCode &&
                      supportedLocale.countryCode == locale.countryCode) {
                    return supportedLocale;
                  }
                }
                return supportedLocales.first;
              },
              navigatorKey: this.navigator,
              theme: ThemeData(
                fontFamily: "Muli",
                primaryColor: theme.primary,
                accentColor: theme.primary,
                textTheme: TextTheme(
                  bodyText2: TextStyle(),
                ),
              ),
              navigatorObservers: observers,
              home: HomeScreen(),
              onGenerateRoute: (settings) {
                final index = ["skvDetail", "hfdDetail"].indexOf(settings.name);
                if (index > -1) {
                  return PageRouteBuilder(
                    settings: settings,
                    pageBuilder: (_, __, ___) {
                      if (index == 1) {
                        return HFDDetailScreen();
                      }
                      return SKVDetailScreen(settings.arguments);
                    },
                    transitionsBuilder: (_, anim, __, child) {
                      return FadeTransition(opacity: anim, child: child);
                    },
                  );
                }
                return MaterialPageRoute(builder: (context) => HomeScreen());
              },
              routes: <String, WidgetBuilder>{
                "home": (ctx) => new HomeScreen(),
                "about": (ctx) => new AboutAppScreen(),
                "aboutDeveloper": (ctx) => new AboutDeveloperScreen(),
                "download": (ctx) => new DownloadScreen(),
                "uiList": (ctx) => new UIListScreen(),
                "uiDetail": (ctx) => new UIDetailScreen(),
                "designerProfile": (ctx) => new DesignerProfileScreen(),

                // Healthy Food Delivery
                "hfdHome": (ctx) => new HFDHomeScreen(),
                // "hfdDetail": (ctx) => new HFDDetailScreen(),

                // Hot Air Balloon
                "habHome": (ctx) => new HABHomeScreen(),

                // Sky View
                "skvHome": (ctx) => new SKVHomeScreen(),
                "skvDetail": (ctx) {
                  final int index = ModalRoute.of(ctx).settings.arguments;
                  return SKVDetailScreen(index);
                },

                "ascHome": (ctx) => new ASCHomeScreen(),

                "etcHome": (ctx) => new ETCHomeScreen(),
              },
            );
          },
        ),
      ),
    );
  }
}
