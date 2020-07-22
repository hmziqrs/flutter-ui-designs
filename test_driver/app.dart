import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_uis/io/io.dart';
import 'package:flutter_uis/main.dart' as app;

void main() {
  enableFlutterDriverExtension(handler: (data) async {
    if (data == "platform") {
      if (Platform.isLinux) {
        return "linux";
      } else if (Platform.isAndroid) {
        return "android";
      } else if (Platform.isIOS) {
        return "ios";
      } else if (Platform.isWindows) {
        return "windows";
      } else if (Platform.isMacOS) {
        return "macos";
      } else {
        return "web";
      }
    }
    return "enableFlutterDriverExtension";
  });

  app.main();
}
