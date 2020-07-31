// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_uis/screens/Home/TestKeys.dart';
import 'package:test/test.dart';

import 'screenshot.dart';
import 'actions.dart';
import 'utils.dart';

void main() async {
  group('Counter App', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();

      final platform = await driver.requestData("platform");

      Utils.driver = driver;
      Actions.driver = driver;
      Screenshot.driver = driver;
      Screenshot.platform = platform;

      await Utils.init(platform);
      await Actions.delay(1000);
      await driver.clearTimeline();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      driver?.close();
    });

    test('Home Screen', () async {
      await driver.runUnsynchronized(() async {
        if (Utils.isDesktop || Utils.isWeb) {
          await Screenshot.screenshot("Home-Screen-Modal");

          await Actions.delay(1000);
          await Actions.tap(HomeScreenTestKeys.modalContinueBtn);
          await Actions.delay(1000);
        }
        await Screenshot.screenshot("Home-Screen");

        await Actions.delay(1000);
      });
    });
  });
}
