import 'dart:isolate';

const String scope = 'AboutAppScreen';

const Map strings = {
  '$scope/title': 'About App',
  '$scope/description':
      'Flutter UI Designs is just an experimental project so please pardon & report any bugs you face',
  '$scope/question1':
      "I crafted this app because I wanted to know flutter's potential to solve real word problems such as.",
  '$scope/question2': "True native performance.",
  '$scope/question3': "Smooth 60FPS animations under the heavy load.",
  '$scope/question4':
      "Difficulty of adapting the dart environment & framework.",
  '$scope/question5': "Potential to write Flexible & Readable code.",
  '$scope/question6':
      "Potential to built pixel perfect UI for different screen size/type",
  '$scope/question7': "Is it really a true Cross Platform framework.",
  '$scope/question8': "Is it superior to React Native.",
  '$scope/answer1':
      "Well for starters I fell in love with flutter at first glance because of no native rendering (Same render/behaviour on different platforms), lightning fast hot reload & near to no configuration to install native libraries. There's so much to talk about but I'll get to my conclusion.",
  '$scope/answer2':
      "It's very close to native & performance difference isn't even noticeable for simple apps.",
  '$scope/answer3':
      "As you can see in UI designs animations are running smooth without any glitches at 60FPS.",
  '$scope/answer4':
      "Someone with Java/Kotlin, Javascript or React Native background it's easy to adapt dart/flutter. Mostly it depends on developer's interest to learn.",
  '$scope/answer5':
      "Yes, Thanks to the widget system in flutter you can implement different kinds of architectures.",
  '$scope/answer6':
      "Yes, As you can see this app supports variety of screen sizes, landscape, tablets/iPads, Web & Desktop platforms.",
  '$scope/answer7':
      "UI part of the framework is true cross platform but most of native packages lacks support for desktop and web platform.",
  '$scope/answer8':
      "In terms of performance YES but flutter lacks in popularity at the time of building this app",
  '$scope/iDont':
      "I don't own any designs that's published in this app. I asked for the permission of designers before I published UIs. And I've gave credit & put all contact information(as much as I could find) of designers.",
};

main(List<String> args, SendPort port) {
  port.send({"strings": strings, "scope": scope});
}
