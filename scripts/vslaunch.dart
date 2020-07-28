import 'dart:convert';
import 'dart:io';

import 'utils.dart' as utils;

const List<String> desktopFilters = ['mac', 'linux', 'windows'];

void main(List<String> args) async {
  final result = await Process.run(
    "flutter",
    ["devices"],
    runInShell: Platform.isWindows,
  ).catchError((err) {
    print(err.toString());
  });
  final List<String> raw = result.stdout.split('\n');
  final filteredDevices = raw.sublist(2, raw.length - 1);

  print("filteredDevices: $filteredDevices");

  final devices = filteredDevices.map((result) {
    final splitter = Platform.isWindows ? 'â€¢' : '•';
    final List<String> arr =
        result.split(splitter).map((str) => str.trim()).toList();
    final String name = arr[0];
    final String deviceId = arr[1];

    final Map<String, dynamic> obj = {
      "name": name,
      "deviceId": deviceId,
      "type": 'dart',
      "request": 'launch',
    };

    final check = desktopFilters.indexWhere(
      (str) => str.toLowerCase().contains(
            deviceId.toLowerCase(),
          ),
    );

    if (check == -1) {
      obj["args"] = ['-t', 'lib/main.mobile.dart'];
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
