/*
  This is probably the most horrible way to implement Platform Class for web.
  But at the time of building this app current library("universal_io:1.0.0") is not wroking with latest flutter master branch. 23/Feb/2020
  BTW I did spent quite lot of time debugging the error but couldn't find a good solution.
  In the end it's what programming is about solving problems.
*/

class Platform {
  static bool isWindows = false;
  static bool isLinux = false;
  static bool isMacOS = false;
  static bool isAndroid = false;
  static bool isFuchsia = false;
  static bool isIOS = false;
}
