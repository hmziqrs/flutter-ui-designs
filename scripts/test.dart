import 'dart:io';

main(List<String> args) {
  final lib = "./test_driver/libs/androidsc.sh";
  final List<String> arguments = [];

  Process.runSync(
    lib,
    arguments,
    runInShell: Platform.isWindows,
  );

  // run(lib, arguments, verbose: true);
}

// main(List<String> args) async {
//   final filePath = "abs.png";
//   final arguments = [
//     "exec-out",
//     "screencap",
//   ];
//   if (!Platform.isLinux) {
//     arguments.addAll(
//       ["-p", ">", filePath],
//     );
//   }
//   final out = Process.runSync(
//     "adb",
//     arguments,
//     runInShell: !Platform.isWindows,
//     // stdoutEncoding: Encoding.getByName("utf8"),
//   );

//   if (Platform.isLinux) {
//     final parse = jsonDecode(out.stdout.toString().replaceAll("\n", "").trim());
//     // final List xl = parse.map((s) => s as int).toList();
//     final xl = List<int>.from(parse);
//     final file = File(filePath);
//     file.writeAsBytesSync(xl);
//   }
// }
