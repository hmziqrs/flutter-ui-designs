part of 'basic_test.dart';

class _Screenshot {
  static Future<void> capture(String name) async {
    print(_Tester.os);
    if (_Tester.os == "macos") {
      print(_Tester.os);
      _macos(name);
    }
  }

  static Future<void> _macos(String name) async {
    Process.runSync("screencapture", ["yoyo.jpg"]);
  }
}
