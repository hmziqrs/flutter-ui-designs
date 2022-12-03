import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_uis/widgets/Screen/TestKeys.dart';
import 'package:integration_test/integration_test.dart';

import 'package:flutter_uis/screens/Home/TestKeys.dart';
import 'package:flutter_uis/main.dart' as app;
import 'package:supercharged/supercharged.dart';
// import 'package:flutter_uis/main.firebase.dart' as app;

void main() {
  final bindings = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    // final driver = await FlutterDriver.connect();
    print("SETUP INTEGRATION OK");
    await 4.seconds.delay;
    print("SETUP INTEGRATION");
  });

  tearDownAll(() async {
    print("tearDownAll");
  });

  group('Test', () {
    testWidgets('Initial', (tester) async {
      await app.main([]);
      await tester.pumpAndSettle();
      print("PRE CONVERT");
      await bindings.convertFlutterSurfaceToImage();
      await tester.pumpAndSettle();
      print("PRE SCREENSHOT");
      await bindings.takeScreenshot("HomeScreen.png");

      await tester.pumpAndSettle();
      print("PRE TAP");
      final widget = find.byKey(Key(HomeScreenTestKeys.settingsBtn));
      await tester.tap(widget);
      await bindings.convertFlutterSurfaceToImage();
      await tester.pumpAndSettle();
      await bindings.takeScreenshot("Testing.png");
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(Key(ScreenWidgetTestKeys.close)));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(Key(HomeScreenTestKeys.downloadBtn)));
      await tester.pumpAndSettle();

      await 4.seconds.delay;
    });
  });
}
