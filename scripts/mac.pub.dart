import 'dart:io';

void main(List<String> args) {
  final file = File("pubspec.yaml");
  if (args.isNotEmpty && args[0] == 'restore') {
    final tmp = File("pubspec.tmp");
    tmp.copySync("pubspec.yaml");
    return;
  }
  file.copySync("pubspec.tmp");
  final fileData = file.readAsStringSync().split("\n").toList();
  final List<String> newDataList =
      fileData.where((element) => !element.contains("firebase")).toList();
  final newData = newDataList.join("\n");

  final newFile = File("pubspec.yaml");
  newFile.writeAsString(newData);
}
