part of 'basic_test.dart';

extension SuperTestString on String {
  Future<void> tap(WidgetTester tester) async {
    await tester.tap(find.text(this));
    await tester.pumpAndSettle();
  }

  Future<void> enterText(WidgetTester tester, String text) async {
    await tester.enterText(find.text(this), text);
    await tester.pumpAndSettle();
  }

  Key key() {
    return Key(this);
  }

  Finder findKey({bool skipOffstage = true}) {
    return find.byKey(key(), skipOffstage: skipOffstage);
  }
}
