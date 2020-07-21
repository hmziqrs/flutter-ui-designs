// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_uis/screens/Home/TestKeys.dart';
import 'package:test/test.dart';

void main() async {
  group('Counter App', () {
    final titleTextFinder = find.byValueKey('title');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
      await driver.clearTimeline();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('starts at 0', () async {
      // Use the `driver.getText` method to verify the counter starts at 0.
      driver.runUnsynchronized(() async {
        expect(await driver.getText(titleTextFinder), "Welcome");
        await driver.tap(find.byValueKey(HomeScreenTestKeys.modalContinueBtn));
      });
    });
  });
}
