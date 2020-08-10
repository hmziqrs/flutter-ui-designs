const String scope = "ASCHomeScreen";

abstract class ASCHomeScreenTestKeys {
  static final String rootScroll = "$scope/rootScroll";
  static final String colorsBase = "$scope/colorsBase";

  // static final String color = "$scope/color";

  static String getSize(int activePage, int index) =>
      ("$scope/size" + "$activePage-$index");

  static String getColor(int activePage, int index) =>
      ("$scope/color" + "$activePage-$index");
}
