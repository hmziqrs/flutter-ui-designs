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
        print("TEST STARTED");
        await Future.delayed(Duration(seconds: 5));
        print("AWAIT WORRKS");
        await Future.delayed(Duration(seconds: 5));
        print("AWAIT WORRKS 1");
        await Future.delayed(Duration(seconds: 5));
        print("AWAIT WORRKS 2");
        await Future.delayed(Duration(seconds: 5));
        print("AWAIT WORRKS 3");
        await Future.delayed(Duration(seconds: 5));
        print("AWAIT WORRKS 4");
        await Future.delayed(Duration(seconds: 5));
      });
    }, timeout: Timeout.none);
  });
}
