import 'dart:convert';
import 'dart:io';

import 'utils.dart' as utils;

const List<String> desktopFilters = ['linux', 'windows'];
final webtype = 'web-javascript';

void main(List<String> args) async {
  final result = await Process.run(
    "flutter",
    ["devices"],
    runInShell: Platform.isWindows,
  ).catchError((err) {
    print(err.toString());
  });
  final List<String> raw = result.stdout.split('\n');
  final splitter = Platform.isWindows ? 'â€¢' : '•';

  final filteredDevices = raw
      .map((String unparsed) => unparsed.split(splitter))
      .toList()
      .where((subList) => subList.length > 1);

  final devices = filteredDevices.map((array) {
    final String name = array[0].trim();
    final String deviceId = array[1].trim();
    final String deviceType = array[2].trim();
    final Map<String, dynamic> obj = {
      "name": name,
      "deviceId": deviceId,
      "type": 'dart',
      "request": 'launch',
    };

    final desktopCheck = desktopFilters.indexWhere(
      (str) => str.toLowerCase().contains(
            deviceId.toLowerCase(),
          ),
    );

    if (desktopCheck == -1) {
      obj["args"] = ['-t', 'lib/main.firebase.dart'];
      if (deviceType == webtype) {
        obj["args"] = ['-t', 'lib/main.firebase.dart'];
      }
    }
    return obj;
  });

  final Map<String, dynamic> newConfig = {
    'version': '1.0.0',
    'configurations': ([
      {
        'name': 'Flutter',
        'request': 'launch',
        'type': 'dart',
      },
      ...devices,
    ]),
    'compounds': [
      {
        'name': 'current',
        'configurations': devices.map((obj) => obj["name"]).toList(),
      },
    ],
  };

  utils.mkDir('.vscode');
  final vsConfig = new File('.vscode/launch.json');
  // final encoded = json.encode(newConfig);
  final JsonEncoder jsonEncoder = JsonEncoder.withIndent('  ');
  final newJson = jsonEncoder.convert(newConfig);

  vsConfig.writeAsStringSync(newJson);

  print(devices);
}
