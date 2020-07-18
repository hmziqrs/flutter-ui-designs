import 'dart:isolate';

const String scope = 'SKVDetailScreen';

const Map strings = {
  '$scope/distanceFromSun': "DISTANCE FROM THE SUN",
  '$scope/oneWayTimeSun': "ONE WAY LIGHT TIME TO THE SUN",
  '$scope/lengthYear': "LENGTH OF YEAR",
  '$scope/earthDays': "Earth Days",
};

main(List<String> args, SendPort port) {
  port.send({"strings": strings, "scope": scope});
}
