import 'dart:io';

import './utils.dart';

main(List<String> args) async {
  print("\n\n\nGENERATE BUNDLED JSON FOR YOUR LOCALIZE MESSAGES");
  final directory = Directory(normalize("lib/models"));
  final rawList = directory.listSync();

  final list = rawList.where(
    (element) {
      final g = element.path.contains(".g.dart");
      if (g) {
        return false;
      }
      final listCheck = rawList.firstWhere(
        (sub) => sub.path == element.path.replaceFirst(".dart", ".g.dart"),
        orElse: () => null,
      );
      return listCheck == null;
    },
  ).toList();

  list.forEach((item) {
    final file = File(item.path);
    final strings = file.readAsLinesSync();
    final List<String> newFile = [];
    String className;
    newFile.add("import 'package:json_annotation/json_annotation.dart';");
    for (int index = 0; index < strings.length; index++) {
      final line = strings[index];

      if (line.contains("class")) {
        final fileName = file.path
            .split(normalize("/"))
            .last
            .replaceFirst(".dart", ".g.dart");
        className = line.split(" ")[1];
        newFile.add("part '$fileName';");
        newFile.add("@JsonSerializable()");
      } else if (index == strings.length - 1) {
        final fromJson =
            "\nfactory $className.fromJson(Map<String, dynamic> data) => _\$${className}FromJson(data);";

        final toJson =
            "\nMap<String, dynamic> toJson() => _\$${className}ToJson(this);";

        newFile.add(fromJson);
        newFile.add(toJson);
      } else {}
      newFile.add(line);
      file.writeAsString(newFile.join("\n"));
    }
  });
}
