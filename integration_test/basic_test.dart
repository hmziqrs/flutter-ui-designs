import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_uis/Navigator.dart';
import 'package:flutter_uis/main.dart';
import 'package:flutter_uis/screens/Home/TestKeys.dart';
import 'package:flutter_uis/widgets/Screen/TestKeys.dart';
import 'package:window_manager/window_manager.dart';
import 'package:integration_test/integration_test.dart';

part '_actions.dart';
part '_ext.dart';

void main(dynamic args) async {
  print(args);
  print("args");
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  final wo = WindowOptions(center: true);
  await windowManager.waitUntilReadyToShow(wo, () async {
    await windowManager.show();
    await windowManager.focus();
    await windowManager.maximize();
  });

  await initMain();

  testWidgets("Test example", (tester) async {
    await tester.pumpWidget(AppNavigator());
    await tester.pumpAndSettle(Duration(seconds: 5));
    await tester.pumpAndSettle();

    await _Actions.closeDesktopModal(tester);
    await tester.pumpAndSettle();

    await _Actions.setTheme(tester, darkMode: false);
    await tester.pumpAndSettle();
  });
}
