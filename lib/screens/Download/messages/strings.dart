import 'dart:isolate';

const String scope = 'DownloadScreen';

const Map strings = {
  '$scope/title': 'Download',
  '$scope/mobile': 'Mobile',
  '$scope/desktop': 'Desktop',
  '$scope/online': 'Online',
};

main(List<String> args, SendPort port) {
  port.send({"strings": strings, "scope": scope});
}
