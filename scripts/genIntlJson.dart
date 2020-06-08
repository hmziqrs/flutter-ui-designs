import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'package:glob/glob.dart';
import 'package:translator/translator.dart';

main(List<String> args) async {
  print("GENERATE BUNDLED JSON FOR YOUR LOCALIZE MESSAGES");
  final dartFile = new Glob("lib/**/**.dart");
  List<FileSystemEntity> files = dartFile.listSync();

  final Map<String, String> rootMessages = {};
  final translator = new GoogleTranslator();

  for (var entity in files) {
    if (entity.path.contains("/messages/strings.dart")) {
      ReceivePort port = new ReceivePort();
      final raw = await getMessagesViaIsolate(entity, port);
      final Map messages = raw["strings"].cast<String, String>();
      rootMessages.addAll(messages);
    }
  }

  final directory = new Directory("./assets/langs");
  await directory.list().forEach((element) async {
    final file = new File(element.path);
    final Map parsed =
        json.decode(file.readAsStringSync()).cast<String, String>();

    if (file.path.contains('en.json')) {
      parsed.addAll(rootMessages);
      final newJson = json.encode(parsed);
      file.writeAsStringSync(newJson);
    } else {
      final langCode = file.path.split('/').last.split('.').first;
      final Map<String, dynamic> newObj = {...rootMessages, ...parsed};
      for (final key in newObj.keys) {
        final String rootVal = rootMessages[key];
        final String parsedVal = parsed[key];
        // if (langCode == "zh") {
        //   print("key $key");
        //   print(
        //       "parsedVal ${(parsedVal == null || (parsedVal != null && parsedVal.isEmpty))} $parsedVal");
        //   print("rootVal $rootVal");
        // }
        if ((parsedVal == null || (parsedVal != null && parsedVal.isEmpty)) &&
            rootVal.isNotEmpty) {
          newObj[key] = await translator.translate(
            newObj[key],
            from: "en",
            to: langCode,
          );
        }
      }
      final newJson = json.encode(newObj);
      file.writeAsStringSync(newJson);
    }
  });
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
