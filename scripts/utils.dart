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

// Doesn't work wasted loads of time
void setEnv(String key, String value) {
  if (Platform.isWindows) {
    final result = Process.runSync(
      "SET",
      [key, "=", value, "&", "echo", "%$key%"],
      // "\$env:$key=\"$value\"",
      // [";", "\$env:$key"],
      runInShell: true,
    );
    // final resulta = Process.runSync(
    //   "\$env:$key",
    //   [],
    //   runInShell: true,
    // );
    print(result.stdout);
    print("ERROR");
    print(result.stderr);
  } else {
    Process.runSync("export", ["$key=$value"]);
  }
}
