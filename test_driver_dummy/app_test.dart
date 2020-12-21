import 'dart:async';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

main(List<String> args) async {
  group("MAIN", () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      // driver?.close();
    });

    // test("REAL TEST", () async {

    // }, timeout: Timeout.none);

    test('Chunk testing', () async {
      await driver.runUnsynchronized(() async {
        // final button = find.byValueKey("button");
        print("TEST STARTED");
        // await driver.tap(button);
        await Future.delayed(Duration(seconds: 5));
        print("AWAIT WORKS");
        // await driver.tap(button);
        await Future.delayed(Duration(seconds: 5));
        print("AWAIT WORKS 1");
        // await driver.tap(button);
        await Future.delayed(Duration(seconds: 5));
        print("AWAIT WORKS 2");
        // await driver.tap(button);
        await Future.delayed(Duration(seconds: 5));
        print("AWAIT WORKS 3");
        // await driver.tap(button);
        await Future.delayed(Duration(seconds: 5));
        print("AWAIT WORKS 4");
        // await driver.tap(button);
        await Future.delayed(Duration(seconds: 5));
      });
    }, timeout: Timeout.none);
  });
}
