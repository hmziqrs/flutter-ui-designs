import 'dart:isolate';

const String scope = 'CCNDetailScreen';

const Map strings = {
  '$scope/calories': "Calories",
  '$scope/ingredients': "Ingredients",
  '$scope/totalTime': "Total Time",
  '$scope/about': "About Recipe",
  '$scope/reviews': "Reviews",
  '$scope/cook': "Cook Now",
};

main(List<String> args, SendPort port) {
  port.send({"strings": strings, "scope": scope});
}
