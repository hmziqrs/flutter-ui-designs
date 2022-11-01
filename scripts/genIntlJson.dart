import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'package:glob/list_local_fs.dart';
import 'package:glob/glob.dart';
import 'package:translator/translator.dart';

import './utils.dart';

main(List<String> args) async {
  print("\n\n\nGENERATE BUNDLED JSON FOR YOUR LOCALIZE MESSAGES");
  final dartFile = new Glob("lib/**/**.dart");
  final translator = new GoogleTranslator();

  final files = dartFile.listSync();
  final Map<String, String> defaultMessages = {};
  final Map<String, Map<String, String>> defaultLocaleMessages = {};
  final JsonEncoder jsonEncoder = JsonEncoder.withIndent('  ');

  for (var entity in files) {
    if (entity.path.contains(normalize("/messages/strings.dart"))) {
      ReceivePort port = new ReceivePort();
      final raw = await getMessagesViaIsolate(entity, port);
      final Map<String, String> messages =
          raw["strings"].cast<String, String>();

      final localesDirectory = new Directory(
        entity.path.replaceFirst(r'strings.dart', r'locales').toString(),
      );
      // print("dlkasdhaskjhd $localesDirectory");
      if (localesDirectory.existsSync()) {
        // print("$localesDirectory EXISSITS");

        // await localesDirectory.list().forEach((localeFile) async {});
        for (final localeFile in localesDirectory.listSync()) {
          final localeCode =
              localeFile.path.split(normalize("/")).last.split(".").first;
          final localeRaw = await getMessagesViaIsolate(
            localeFile,
            new ReceivePort(),
          );
          final Map<String, String> localeMessages =
              localeRaw.cast<String, String>();
          if (defaultLocaleMessages[localeCode] == null) {
            defaultLocaleMessages[localeCode] = {};
          }
          defaultLocaleMessages[localeCode]!.addAll(localeMessages);
        }
      }

      defaultMessages.addAll(messages);
    }
  }

  final directory = new Directory(normalize("./assets/langs"));

  await directory.list().forEach((element) async {
    final file = new File(element.path);
    final Map parsed =
        json.decode(file.readAsStringSync()).cast<String, String>();

    if (file.path.contains('en.json')) {
      parsed.addAll(defaultMessages);

      final newJson = jsonEncoder.convert(parsed);

      file.writeAsStringSync(newJson);
    } else {
      final langCode = file.path.split(normalize('/')).last.split('.').first;
      final Map<String, dynamic> newObj = {...defaultMessages, ...parsed};
      final localeMessages = defaultLocaleMessages[langCode];

      for (final key in newObj.keys) {
        if (localeMessages != null && localeMessages[key] != null) {
          newObj[key] = localeMessages[key];
          continue;
        }

        final String rootVal = defaultMessages[key]!;
        final String parsedVal = parsed[key];
        // if (langCode == "zh") {
        //   print("key $key");
        //   print(
        //       "parsedVal ${(parsedVal == null || (parsedVal != null && parsedVal.isEmpty))} $parsedVal");
        //   print("rootVal $rootVal");
        // }
        if (((parsedVal.isEmpty)) &&
            rootVal.isNotEmpty) {
          newObj[key] = await translator.translate(
            newObj[key],
            from: "en",
            to: langCode,
          );
        }
      }

      final newJson = jsonEncoder.convert(newObj);

      file.writeAsStringSync(newJson);
    }
  });
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
