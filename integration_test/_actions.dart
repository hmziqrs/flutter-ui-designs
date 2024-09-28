part of 'basic_test.dart';

class _Actions {
  static closeDesktopModal(WidgetTester tester) async {
    await tester.tap(HomeScreenTestKeys.modalContinueBtn.findKey());
    await tester.pumpAndSettle();
  }

  static setTheme(WidgetTester tester, {bool darkMode = true}) async {
    await tester.tap(HomeScreenTestKeys.settingsBtn.findKey());
    await tester.pumpAndSettle();

    final themeKey = darkMode
        ? ScreenWidgetTestKeys.darkTheme
        : ScreenWidgetTestKeys.lightTheme;

    await tester.tap(themeKey.findKey());
    await tester.pumpAndSettle();

    await tester.tap(ScreenWidgetTestKeys.close.findKey());
    await tester.pumpAndSettle();
  }
}
