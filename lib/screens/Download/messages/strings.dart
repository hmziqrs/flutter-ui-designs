import 'dart:isolate';

const String scope = 'DownloadScreen';

const Map strings = {
  '$scope/title': 'Download',
};

main(List<String> args, SendPort port) {
  port.send({"strings": strings, "scope": scope});
}
