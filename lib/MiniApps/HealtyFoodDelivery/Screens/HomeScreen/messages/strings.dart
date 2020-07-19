import 'dart:isolate';

const String scope = 'HFDHomeScreen';

const Map strings = {
  '$scope/title': 'Healthy Food',
  '$scope/nearBy': 'Near By',
  '$scope/recommended': 'Recommended',
  '$scope/popular': 'Popular',
  '$scope/breakfast': 'Breakfast',
  '$scope/lunch': 'Lunch',
  '$scope/bevrages': 'Beverages',
  '$scope/snack': 'Snack',
  '$scope/topRestaurants': 'Top Restaurants',
};

main(List<String> args, SendPort port) {
  port.send({"strings": strings, "scope": scope});
}
