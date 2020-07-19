import 'dart:isolate';

const String scope = 'ASCHomeScreen';

const Map strings = {
  '$scope/size': "SIZE",
  '$scope/newText': "NEW",
  '$scope/colours': "COLOURS",
  '$scope/usd': "USD",
};

main(List<String> args, SendPort port) {
  port.send({"strings": strings, "scope": scope});
}
