import 'dart:io';

import 'utils.dart' as utils;

const desktopFlags = ["windows", "macos", "linux"];
const mobileFlags = ["ios", "android"];

final deviceMap = {
  "windows": "windows",
  "linux": "linux",
  "mac": "mac",
};

// NOT IN USE
// FAILED HORRIBLY WATSED GOOD AMOUNT OF TIME

main(List<String> args) async {
  final String platform = args[0];
  const int observatoryPort = 8888;
  String targetFile = utils.normalize("./lib/main.mobile.dart");
  final tmpEnvFile = File("env.tmp");

  tmpEnvFile.writeAsStringSync(platform);

  if (desktopFlags.contains(platform)) {
    targetFile = utils.normalize("./lib/main.dart");
  }

  final flutter = await Process.start(
    "flutter",
    [
      "run",
      "--observatory-port",
      observatoryPort.toString(),
      "-t",
      targetFile,
      "-d",
      deviceMap[platform],
    ],
    runInShell: Platform.isWindows,
  );

  print("FLUTTER OUT");
  print(flutter.stdout);
  print("FLUTTER error");
  print(flutter.stderr);

  flutter.stdout.listen((event) {
    print(event.toString());
  });

  utils.setEnv("VM_SERVICE_URL", "http://127.0.0.1:$observatoryPort/");
}
