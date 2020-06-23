import 'dart:isolate';

const String scope = 'HomeScreen';

const Map strings = {
  '$scope/title': '欢迎',
};

main(List<String> args, SendPort port) {
  port.send(strings);
}
