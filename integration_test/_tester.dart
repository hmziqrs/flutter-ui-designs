part of 'basic_test.dart';

class _Tester {
  static late WidgetTester ins;
  static late String os;

  static void init(WidgetTester ins, String os) {
    _Tester.ins = ins;
    _Tester.os = os;
  }
}
