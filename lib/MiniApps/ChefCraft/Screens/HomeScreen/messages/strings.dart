import 'dart:isolate';

const String scope = 'CCNHomeScreen';

const Map strings = {
  '$scope/heading': "Looking for your favorite meal",

  // categories
  '$scope/cat1': "Breakfast",
  '$scope/cat2': "Lunch",
  '$scope/cat3': "Dinner",
  '$scope/cat4': "Snacks",

  // tabs
  '$scope/tab1': "Home",
  '$scope/tab2': "Meal Plan",
  '$scope/tab3': "Subscription",
  '$scope/tab4': "More",
};

main(List<String> args, SendPort port) {
  port.send({"strings": strings, "scope": scope});
}
