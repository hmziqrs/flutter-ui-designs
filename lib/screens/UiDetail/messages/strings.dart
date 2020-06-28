import 'dart:isolate';

const String scope = 'UIDetailScreen';

const Map strings = {
  '$scope/title': 'About App',
  '$scope/by': 'By',
  '$scope/openApp': 'Open App',
  '$scope/viewSource': 'View UI Source',
  '$scope/contact': 'Contact',
  '$scope/moreUIs': 'More UIs from',
  '$scope/platformNScreens': 'Platform And Screens',
  '$scope/landscape': 'Landscape',
  '$scope/tablet': 'Tablet',
  '$scope/android': 'Android',
  '$scope/ios': 'iOS',
  '$scope/web': 'Web',
  '$scope/desktop': 'Desktop',
};

main(List<String> args, SendPort port) {
  port.send({"strings": strings, "scope": scope});
}
