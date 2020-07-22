import 'package:flutter_driver/flutter_driver.dart';

abstract class Actions {
  static FlutterDriver driver;

  static Future<void> tap(String key) async {
    await driver.tap(find.byValueKey(key));
  }
}
