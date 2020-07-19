import 'dart:io';

String normalize(String path) {
  if (Platform.isWindows) {
    return path.replaceAll("/", "\\");
  }
  return path;
}

dynamic mkDir(String path, {bool logs = false}) {
  try {
    final file = Directory(path);
    final check = file.existsSync();
    if (logs) {
      print('path: $path');
      print('check: $check');
    }
    if (!check) {
      return file.createSync();
    }
    return check;
  } catch (e) {
    throw e;
  }
}
