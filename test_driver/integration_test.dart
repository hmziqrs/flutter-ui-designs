// import 'package:integration_test/integration_test_driver_extended.dart';

import 'package:integration_test/integration_test_driver.dart';

Future<void> main() async {
  try {
    await integrationDriver();
    // await integrationDriver(
    //   onScreenshot: (name, bytes) async {
    //     final image = await File('screenshots/$name.png').create(
    //       recursive: true,
    //     );
    //     image.writeAsBytesSync(bytes);
    //     return true;
    //   },
    // );
  } catch (e) {
    print("e");
  }
}
