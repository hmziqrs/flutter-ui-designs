import 'dart:isolate';

const String scope = 'HABHomeScreen';

const Map strings = {
  '$scope/title': "Cappadocia\nHot Air Balloon",
  '$scope/subTitle': "Once in a lifetime adventure",
  '$scope/flight': "Flight",
};

main(List<String> args, SendPort port) {
  port.send({"strings": strings, "scope": scope});
}
