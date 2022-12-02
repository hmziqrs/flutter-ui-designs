import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_uis/screens/Home/TestKeys.dart';
import 'package:integration_test/integration_test.dart';

import 'package:flutter_uis/main.dart' as app;
// import 'package:flutter_uis/main.firebase.dart' as app;

void main() {
  final bindings = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Test', () {
    testWidgets('Initial', (tester) async {
      await app.main([]);
      await tester.pumpAndSettle();

      final widget = find.byKey(Key(HomeScreenTestKeys.settingsBtn));

      await tester.tap(widget);
      await tester.pumpAndSettle();
      // await bindings.takeScreenshot("Testing.png");

      // tearDownAll(() {
      //   print("tearDownAll");
      // });
    });
  });
}
