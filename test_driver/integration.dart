import 'dart:developer';
import 'dart:io';

import 'package:integration_test/integration_test_driver_extended.dart';

// import 'package:integration_test/integration_test_driver.dart';

// void main() => integrationDriver();

Future<void> main() async {
  try {
    await integrationDriver(
      onScreenshot: (name, bytes) async {
        log('onScreenshot: (name, bytes) async {');
        final image = await File('$name.png').create(
          recursive: true,
        );
        image.writeAsBytesSync(bytes);
        return true;
      },
    );
  } catch (e) {
    print("e");
  }
}
