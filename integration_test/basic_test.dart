import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_uis/Navigator.dart';
import 'package:flutter_uis/main.dart';
import 'package:integration_test/integration_test.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  await initMain();

  testWidgets("Test example", (tester) async {
    await tester.pumpWidget(AppNavigator());

    await tester.pumpAndSettle(Duration(seconds: 5));
    await tester.pumpAndSettle();
  });
}
