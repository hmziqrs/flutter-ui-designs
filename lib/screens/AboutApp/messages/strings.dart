import 'dart:isolate';

const String scope = 'AboutAppScreen';

const Map strings = {
  '$scope/title': 'About App',
  '$scope/description':
      'This is an experimental project. So please report any bugs you may encounter. I\'ll try to fix them as soon as possible. If you have any suggestions or feedback, please let me know. I\'ll be happy to hear from you.',
  '$scope/conclusion':
      'Here are some questions I asked myself before starting the project.',
  '$scope/question1': 'Why build this app?',
  '$scope/answer1':
      'I wanted to learn Flutter and started searching for ideas to implement. API-based CRUD apps like Todo lists seemed simple and repetitive to me since I had created many of them before. However, I lacked the skills to implement animations at that time. This led me to decide to build this app.',
  //
  '$scope/question2': 'Is Flutter\'s performance truly native?',
  '$scope/answer2':
      'In my opinion, yes. Flutter provides near-native performance since the code is compiled and there is no code interpolation at runtime, resulting in fast execution.',
  //
  '$scope/question3': 'Do complex animations run at a smooth 60FPS?',
  '$scope/answer3':
      'Yes, the app features some complex parallax animations, and I find Flutter provides a smooth experience without any jank or skipped frames.',
  //
  '$scope/question4':
      'How is Dart\'s learning curve and the mindset shift required for thinking in Flutter?',
  '$scope/answer4':
      'The learning curve for Dart is relatively easy if you\'re familiar with object-oriented languages like Java and TypeScript. However, adapting to Flutter\'s UI composition approach and understanding the BuildContext, responsible for consuming theme, translation, and business data, may require some practice and a mindset shift.',
  //
  '$scope/question5':
      'How does Flutter scale UI for desktop, tablet, and mobile?',
  '$scope/answer5':
      'Flutter\'s documentation provides strategies for managing UI across multiple screen sizes. Additionally, I have developed my custom guidelines for scaling UI.',
//
  '$scope/question6':
      'Is Flutter truly cross-platform for both desktop and mobile operating systems?',
  '$scope/answer6':
      'On the UI level, it is true since Flutter uses its engine for rendering UI. But like every cross-platform framework, limitation arrives when a third-party library may support one platform but not the other.',
  //
  '$scope/question7': 'Is Flutter superior to React Native?',
  '$scope/answer7':
      'In terms of performance, yes. However, in terms of support and ecosystem, React Native has an advantage due to its access to a vast ecosystem of JavaScript libraries and a large mature community for support.',
  //
  '$scope/iDont':
      'I do not own any UI designs that are published in this app. I asked for the permission of designers before I published UI designs. I\'ve given credit & put all the designers\' contact information (as much as I could find).',
};

main(List<String> args, SendPort port) {
  port.send({'strings': strings, 'scope': scope});
}
