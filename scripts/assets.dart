import 'dart:io';

import 'package:recase/recase.dart';

import 'utils.dart';

const CODE_FILE_PATH = "./lib/StaticAssets.dart";

main(List<String> args) async {
  final start = DateTime.now();

  final assetsDir = Directory(normalize("./assets/"));
  final assetsDirPaths = assetsDir.listSync();

  final keys = [];

  assetsDirPaths.forEach((file) {
    final dir = Directory(file.path);
    final chunks = file.path.split(normalize("/"));
    final scope = chunks.last;
    keys.add("\n\t// $scope paths");
    dir.listSync().forEach((element) {
      if (!element.path.contains(RegExp('(?:jpg|gif|png|json)'))) {
        return;
      }
      final filePath = element.path.replaceFirst("." + normalize("/"), "");
      var fileName = filePath.split(normalize("/")).last.split(".").first;
      final varName =
          scope + " " + fileName.replaceAll(RegExp(r'[^\w\s]+'), " ");
      final key =
          "\tstatic final ${varName.camelCase} = \"${filePath.replaceAll(normalize("/"), "/")}\";";
      keys.add(key);
    });
  });

  final classData = generateStaticClass(keys.join("\n"));
  final classFile = File(CODE_FILE_PATH);
  await classFile.writeAsString(classData);

  final end = DateTime.now();
  print(end.difference(start).inMilliseconds.toString() + "ms");
}

String generateStaticClass(String keys) {
  return '''
// This is an auto generated file. Do not make any change on this.

class StaticAssets {
$keys
}
''';
}
