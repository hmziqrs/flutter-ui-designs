import 'dart:io';
import 'dart:isolate';
import 'package:glob/glob.dart';

// This file for generating keys for message files

main(List<String> args) async {
  print("GENERATE CLASS KEYS FOR YOUR LOCALIZE MESSAGES");
  final dartFile = new Glob("lib/**/**.dart");
  List<FileSystemEntity> files = dartFile.listSync();

  for (var entity in files) {
    if (entity.path.contains("/messages/strings.dart")) {
      final keysFile = new File(entity.path.replaceAll('strings', 'keys'));
      ReceivePort port = new ReceivePort();
      final raw = await getMessagesViaIsolate(entity, port);
      final scope = raw["scope"];
      final Map messages = raw["strings"];
      final keys = messages.keys
          .map(
            (str) {
              final key = str.toString();
              final parsedKey = key.split('/').last;
              return "\tstatic String $parsedKey = '\$scope\/$parsedKey';";
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
    Uri.parse(entity.resolveSymbolicLinksSync()),
    null,
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
