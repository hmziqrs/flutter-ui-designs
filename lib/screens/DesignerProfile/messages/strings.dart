import 'dart:isolate';

const String scope = 'DesignerProfileScreen';

const Map strings = {
  '$scope/contactMe': 'Contact me',
  '$scope/hireMe': 'Hire me freelance',
  '$scope/explore': 'Explore more designs',
  '$scope/portfolio': 'My Portfolio',
  '$scope/follow': 'Follow me',
};

main(List<String> args, SendPort port) {
  port.send({"strings": strings, "scope": scope});
}
