import 'dart:isolate';

const String scope = 'SKVHomeScreen';

const Map strings = {
  '$scope/explore': "Explore",
  '$scope/popular': "Popular",

  // Tabs
  '$scope/planets': "Planets",
  '$scope/stars': "Stars",
  '$scope/satellites': "Satellites",
  '$scope/astroids': "Astroids",
  '$scope/comets': "Comets",

  // SearchBar
  '$scope/searchBar': "Search Planets, Stars, Satellite",
};

main(List<String> args, SendPort port) {
  port.send({"strings": strings, "scope": scope});
}
