import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_uis/widgets/Screen/TestKeys.dart';
import 'package:test/test.dart';

import 'package:flutter_uis/MiniApps/HealtyFoodDelivery/Screens/HomeScreen/TestKeys.dart';
import 'package:flutter_uis/MiniApps/AsicsShoesConcept/Screens/HomeScreen/TestKeys.dart';
import 'package:flutter_uis/MiniApps/EggTimerConcept/Screens/HomeScreen/TestKeys.dart';
import 'package:flutter_uis/MiniApps/HotAirBalloons/Screens/DetailScreen/TestKeys.dart';
import 'package:flutter_uis/MiniApps/SkyView/Screens/DetailScreen/TestKeys.dart';
import 'package:flutter_uis/MiniApps/SkyView/Screens/HomeScreen/TestKeys.dart';
import 'package:flutter_uis/MiniApps/HotAirBalloons/data/TestKeys.dart';
import 'package:flutter_uis/MiniApps/SkyView/data/TestKeys.dart';
import 'package:flutter_uis/screens/UIList/TestKeys.dart';

import 'package:flutter_uis/screens/Home/TestKeys.dart';
// import 'package:flutter_uis/widgets/Screen/TestKeys.dart';
import 'package:flutter_uis/screens/UIDetail/TestKeys.dart';
import 'package:flutter_uis/statics/data/uiListTestKeys.dart';

import 'screenshot.dart';
import 'actions.dart';
import 'utils.dart';

void main() async {
  group('Counter App', () {
    late FlutterDriver driver;
    late double width;
    late double height;

    setUpAll(() async {
      driver = await FlutterDriver.connect();

      final txxx = find.byType('NavigatorState');

      print("txxx $txxx");


      final platform = await driver.requestData("platform");
      print("platform $platform");
      final device = await driver.requestData("device");
      print("device $device");
      final dimensions = (await driver.requestData("dimensions")).split(",");

      width = double.parse(dimensions[0]);
      height = double.parse(dimensions[1]);

      Utils.driver = driver;
      TestActions.driver = driver;
      Screenshot.driver = driver;
      Screenshot.platform = platform;
      Screenshot.device = device;

      await Utils.init(platform);
      await TestActions.delay(1000);

      // await driver.clearTimeline();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      await TestActions.delay(8000);
      driver.close();
    });

    // test('Chunk testing', () async {
    //   await driver.runUnsynchronized(() async {
    //     await TestActions.delay(4000);
    //     print("CHUNK TESTING");
    //   });
    // }, timeout: Timeout.none);
    // return;

    test(
      'ScreenShots',
      () async {
        await driver.runUnsynchronized(() async {
          print("$width $height");
          if (Utils.isDesktop || Utils.isWeb) {
            await Screenshot.screenshot("Home-Screen-Modal");
            await TestActions.tap(HomeScreenTestKeys.modalContinueBtn);
          }
          // Home Screen
          await Screenshot.screenshot("Home-Screen");
          await TestActions.tap(HomeScreenTestKeys.settingsBtn);
          print("Home Screen Complete");

          // Settings Modal
          await Screenshot.screenshot("Settings-Modal");
          await TestActions.tap(ScreenWidgetTestKeys.close);
          print("Settings Modal Complete");

          // Download Screen
          await TestActions.delay(1000);
          await TestActions.tap(HomeScreenTestKeys.downloadBtn);
          await Screenshot.screenshot("Download-Screen");
          await TestActions.goBack();
          print("Download Screen Complete");

          // About Developer Screen
          await TestActions.delay(1000);
          await TestActions.tap(HomeScreenTestKeys.aboutDeveloperBtn);
          await Screenshot.screenshot("AboutDeveloper-Screen");
          await TestActions.goBack();
          print("About Developer Complete");

          // About App Screen
          await TestActions.delay(1000);
          await TestActions.tap(HomeScreenTestKeys.aboutBtn);
          await Screenshot.screenshot("AboutApp-Screen");
          await TestActions.goBack();
          print("About App Complete");

          // Explore UIs Screen
          await TestActions.delay(1000);
          await TestActions.tap(HomeScreenTestKeys.uiListBtn);
          await Screenshot.screenshot("ExploreUIs-Screen");
          print("Explores UIs Complete");

          // Mini App HFD Flow
          await TestActions.delay(1000);
          await TestActions.tap(UIListDataTestKeys.hfd);
          await Screenshot.screenshot("HFD-Detail-Screen");
          await TestActions.tap(UIDetailScreenTestKeys.openApp);

          // Mini App HFD Home Screen
          await Screenshot.screenshot("HFD-Home-Screen-1");
          await TestActions.scrollUntil(
            scroller: HFDHomeScreenTestKeys.foodItemsScroll,
            item: HFDHomeScreenTestKeys.foodItem9,
            x: -140.0,
          );
          await Screenshot.screenshot("HFD-Home-Screen-2");
          await TestActions.scrollUntil(
            scroller: HFDHomeScreenTestKeys.rootScroll,
            item: HFDHomeScreenTestKeys.restaurantScroll,
            y: -100.0,
          );
          await TestActions.scrollUntil(
            scroller: HFDHomeScreenTestKeys.restaurantScroll,
            item: HFDHomeScreenTestKeys.restaurant5,
            x: -360.0,
          );
          await Screenshot.screenshot("HFD-Home-Screen-3");

          // Mini App HFD Detail Screen
          await TestActions.tap(HFDHomeScreenTestKeys.foodItem9);
          await Screenshot.screenshot("HFD-Detail-Screen");
          await TestActions.goBack(3);
          print("Mini App HFD Complete");

          // Mini App HAB Home Screen
          await TestActions.tap(UIListDataTestKeys.hab);
          await TestActions.tap(UIDetailScreenTestKeys.openApp);
          await TestActions.delay();
          await Screenshot.screenshot("HAB-Home-Screen");

          // Mini App HAB Detail Screen
          await TestActions.tap(HABRootTestKeys.standard);
          await Screenshot.screenshot("HAB-Detail-Screen-1");
          await TestActions.scroll(
            scroller: HABDetailScreenTestKeys.rootPageView,
            x: -width,
          );
          await TestActions.delay();
          await Screenshot.screenshot("HAB-Detail-Screen-2");
          await TestActions.scroll(
            scroller: HABDetailScreenTestKeys.rootPageView,
            x: -width,
          );
          await TestActions.delay();
          await TestActions.scrollUntil(
            scroller: HABDetailScreenTestKeys.tabsScroll,
            item: HABDetailScreenTestKeys.tabPreFlightInfo,
            x: -80.0,
          );
          await TestActions.delay();
          await TestActions.tap(HABDetailScreenTestKeys.tabPreFlightInfo);
          await Screenshot.screenshot("HAB-Detail-Screen-3");
          await TestActions.scrollUntil(
            scroller: HABDetailScreenTestKeys.tabsScroll,
            item: HABDetailScreenTestKeys.tabInFlightInfo,
            x: -80.0,
          );
          await TestActions.delay();
          await TestActions.tap(HABDetailScreenTestKeys.tabInFlightInfo);
          await Screenshot.screenshot("HAB-Detail-Screen-4");
          await TestActions.scrollUntil(
            scroller: HABDetailScreenTestKeys.tabsScroll,
            item: HABDetailScreenTestKeys.tabPostFlightInfo,
            x: -80.0,
          );
          await TestActions.delay();
          await TestActions.tap(HABDetailScreenTestKeys.tabPostFlightInfo);
          await Screenshot.screenshot("HAB-Detail-Screen-5");
          print("Mini App HAB Complete");

          await TestActions.goBack(3);

          // Mini App SKV Home Screen
          await TestActions.tap(UIListDataTestKeys.skv);
          await TestActions.tap(UIDetailScreenTestKeys.openApp);
          await TestActions.delay();
          await Screenshot.screenshot("SKV-Home-Screen-1");
          await TestActions.scrollUntil(
            scroller: SKVHomeScreenTestKeys.planetsScroll,
            item: SKVRootTestKeys.jupiter,
            x: -160.0,
          );
          await Screenshot.screenshot("SKV-Home-Screen-2");
          await TestActions.scrollUntil(
            scroller: SKVHomeScreenTestKeys.rootScroll,
            item: SKVRootTestKeys.story6,
            y: -200.0,
          );
          await Screenshot.screenshot("SKV-Home-Screen-3");
          await TestActions.scrollUntil(
            scroller: SKVHomeScreenTestKeys.rootScroll,
            item: SKVHomeScreenTestKeys.planetsScroll,
            y: -200.0,
          );
          TestActions.delay();
          await TestActions.tap(SKVRootTestKeys.jupiter);

          // Mini App SKV Detail Screen
          await Screenshot.screenshot("SKV-Detail-Screen-1", pre: 1000);
          await TestActions.scroll(
            scroller: SKVDetailScreenTestKeys.rootScroll,
            x: width,
          );
          await Screenshot.screenshot("SKV-Detail-Screen-2");
          await TestActions.scroll(
            scroller: SKVDetailScreenTestKeys.rootScroll,
            x: width,
          );
          await Screenshot.screenshot("SKV-Detail-Screen-3");
          print("Mini App SKV Complete");

          await TestActions.goBack(3);

          // Mini App ASC Home Screen
          await TestActions.scrollUntil(
            scroller: UIListScreenTestKeys.rootScroll,
            item: UIListDataTestKeys.asc,
            y: -160.0,
          );
          await TestActions.tap(UIListDataTestKeys.asc);
          await TestActions.tap(UIDetailScreenTestKeys.openApp);
          await TestActions.scrollUntil(
            scroller: ASCHomeScreenTestKeys.rootScroll,
            item: ASCHomeScreenTestKeys.colorsBase,
            y: -140.0,
          );
          await TestActions.tap(ASCHomeScreenTestKeys.getColor(0, 3));
          await Screenshot.screenshot("ASC-Home-Screen-1");
          await TestActions.scroll(
            scroller: ASCHomeScreenTestKeys.rootScroll,
            x: -width,
          );
          await TestActions.delay();
          await TestActions.scrollUntil(
            scroller: ASCHomeScreenTestKeys.rootScroll,
            item: ASCHomeScreenTestKeys.colorsBase,
            y: -140.0,
          );
          await TestActions.tap(ASCHomeScreenTestKeys.getColor(1, 1));
          await TestActions.tap(ASCHomeScreenTestKeys.getSize(1, 2));
          await Screenshot.screenshot("ASC-Home-Screen-2");
          await TestActions.scroll(
            scroller: ASCHomeScreenTestKeys.rootScroll,
            x: -width,
          );
          await TestActions.delay();
          await TestActions.scrollUntil(
            scroller: ASCHomeScreenTestKeys.rootScroll,
            item: ASCHomeScreenTestKeys.colorsBase,
            y: -140.0,
          );
          await TestActions.tap(ASCHomeScreenTestKeys.getColor(2, 3));
          await TestActions.tap(ASCHomeScreenTestKeys.getSize(2, 4));
          await Screenshot.screenshot("ASC-Home-Screen-3");
          print("Mini App ASC Complete");

          await TestActions.goBack(2);

          // Mini App ETC Home Screen
          await TestActions.delay();
          await TestActions.scrollUntil(
            scroller: UIListScreenTestKeys.rootScroll,
            item: UIListDataTestKeys.etc,
            y: -160.0,
          );
          await TestActions.tap(UIListDataTestKeys.etc);
          await TestActions.tap(UIDetailScreenTestKeys.openApp);
          await Screenshot.screenshot("ETC-Home-Screen-1");
          await driver.scroll(
            find.byValueKey(ETCHomeScreenTestKeys.radiusBase),
            -100.0,
            0.0,
            Duration(milliseconds: 400),
          );
          await Screenshot.screenshot("ETC-Home-Screen-2");
          await TestActions.tap(ETCHomeScreenTestKeys.playPauseBtn);
          await Screenshot.screenshot("ETC-Home-Screen-3");
          await TestActions.tap(ETCHomeScreenTestKeys.resetBtn);
          await Screenshot.screenshot("ETC-Home-Screen-4");

          await TestActions.delay(2000);
        });
      },
      timeout: Timeout.none,
    );
  });
}
