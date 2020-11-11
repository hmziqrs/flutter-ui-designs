import 'dart:io';
import 'package:yaml/yaml.dart';
import 'package:io/ansi.dart';

import 'spliticonTemp.dart';

void main(List<String> arguments) {
  // Platform.environment.forEach((k,v)=>print('$k $v'));
  // 执行命令
  // Process.run(executable, arguments);
  print(green
      .wrap('${DateTime.now()}: The command is executing, please wait...'));
  var pubSpec = File('./pubspec.yaml');
  var pubSpecDoc = loadYaml(pubSpec.readAsStringSync());
  var packages = File('./.packages');
  if (!packages.existsSync()) {
    print(yellow.wrap('${DateTime.now()}: Get the dependencies first'));
    return;
  }
  // ignore: omit_local_variable_types
  List<String> lines = packages.readAsLinesSync();
  // flutter_icons:file:///Users/makisu/development/flutter/.pub-cache/hosted/pub.flutter-io.cn/flutter_icons-1.0.0+1/lib/
  String flutterIconPath;
  var flutterIconVersion;
  for (var i = 0; i < lines.length; i++) {
    if (lines[i].contains('flutter_icons')) {
      flutterIconPath = lines[i]
          .replaceAll(
              "flutter_icons:file://${Platform.isWindows ? '/' : ''}", '')
          .replaceAll('/lib/', '');
      flutterIconVersion =
          flutterIconPath.substring(flutterIconPath.lastIndexOf('-'));
      break;
    }
  }
  if (flutterIconPath == null) {
    print(yellow
        .wrap('${DateTime.now()}: Get the flutter_icons dependency first'));
    return;
  }
  // ignore: omit_local_variable_types
  File flutterIconsFile = File(flutterIconPath + '/pubspec.yaml');
  List includes;
  var yamlString = tempYaml(flutterIconVersion);
  if (pubSpecDoc['flutter_icons'] != null &&
      pubSpecDoc['flutter_icons']['includes'] != null) {
    includes = pubSpecDoc['flutter_icons']['includes'];
    includes.forEach((key) {
      yamlString += fontsMap[key];
    });
  } else {
    yamlString += allFonts;
  }
  flutterIconsFile.writeAsStringSync(yamlString);
  var resDoc = loadYaml(yamlString);
  var useFonts =
      List.of(resDoc['flutter']['fonts']).map((item) => item['family']);
  print('${DateTime.now()}: The font you are using is $useFonts');
  print(green.wrap('${DateTime.now()}: Finish the work'));
}
