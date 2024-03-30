import 'dart:io';
import 'dart:isolate';
import 'package:glob/glob.dart';
import 'package:glob/list_local_fs.dart';

import 'utils.dart';

// This file for generating keys for message files

main(List<String> args) async {
  print("GENERATE CLASS KEYS FOR YOUR LOCALIZE MESSAGES");
  final fileIndex = args.indexOf("--file");
  final filesGlob = Glob("lib/**/**.dart");
  List<FileSystemEntity> files = [];
  if (fileIndex >= 0) {
    final path = args[fileIndex + 1];
    final source = File(path);
    files = [source];
  }
  if (fileIndex < 0) {
    files = filesGlob.listSync();
  }

  for (var entity in files) {
    if (entity.path.contains(normalize("/messages/strings.dart"))) {
      final keysFile = File(entity.path.replaceAll('strings', 'keys'));
      ReceivePort port = ReceivePort();
      final raw = await getMessagesViaIsolate(entity, port);
      final scope = raw["scope"];
      final Map messages = raw["strings"];
      final keys = messages.keys
          .map(
            (str) {
              final key = str.toString();
              final parsedKey = key.split('/').last;
              return "\tstatic const $parsedKey = '\$scope/$parsedKey';";
            },
          )
          .toList()
          .join('\n');
      final classInString = classTemplate(scope, keys);
      await keysFile.writeAsString(classInString);
    }
  }
}

Future<Map> getMessagesViaIsolate(
  FileSystemEntity entity,
  ReceivePort port,
) async {
  await Isolate.spawnUri(
    Uri.parse(entity.resolveSymbolicLinksSync().replaceAll("\\", "/")),
    [],
    port.sendPort,
  );
  final Map messages = await port.first;
  port.close();
  return messages;
}

String classTemplate(scope, keys) {
  return '''
// This is an auto generated file. Do not make any change on this.

const scope = '$scope';

abstract class ${scope}Messages {
$keys
}
''';
}
