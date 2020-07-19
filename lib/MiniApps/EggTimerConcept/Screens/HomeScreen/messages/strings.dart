import 'dart:isolate';

const String scope = 'ETCHomeScreen';

const Map strings = {
  '$scope/restart': 'Restart',
  '$scope/reset': 'Reset',
  '$scope/play': 'Play',
  '$scope/pause': 'Pause',
};

main(List<String> args, SendPort port) {
  port.send({"strings": strings, "scope": scope});
}
