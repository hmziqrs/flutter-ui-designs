import 'dart:isolate';

const String scope = 'AboutDeveloperScreen';

const Map strings = {
  // Title
  '$scope/title': 'About Developer',
  '$scope/intro':
      'Hi, I am a full-stack developer with over 7 years of experience in developing software. I have expertise in multiple languages and frameworks and am passionate about creating open-source apps. I enjoy watching anime in my free time, with Dragon Ball Z being my all-time favorite. I also play games, and some of my favorites include Cyberpunk 2077, Horizon Forbidden West, and Detroit: Become Human.',

  '$scope/skillSet': 'My Skill Set',
  '$scope/contacts': 'My Contacts',
  '$scope/contactsDesc':
      "I've shared my contacts strictly for business related queries ONLY.\nFor any Flutter related help post your query on Flutter Github, Flutter sub reddit & Flutter facebook groups",
  '$scope/likeProject': 'Like The Project?',
  '$scope/likeProjectDesc':
      "Show support by performing any action listed below.",
  '$scope/moreProjects': 'Explore More Projects',

  // Projects
  '$scope/projectINVMovie1':
      "A static movie app featuring a heavily animated experience for ticket reservations.",
  '$scope/projectRNL':
      "React Native implementation of the puzzle game Loop.",
  '$scope/projectGandalf':
      "An infinite loop of gandalf being glorious with sax in the background.",
  '$scope/projectHCV':
      "My web based resume built with HTML, CSS and JavaScript.",

  // actions
  '$scope/likeProject1': "Star this repository",
  '$scope/likeProject2': "Review this app on",
  '$scope/likeProject3': "Endorse my skills on",
  '$scope/likeProject4': "Favorite my gigs on",

  // singulars
  '$scope/share': 'Share',
  '$scope/copy': 'Copy',
  '$scope/open': 'Open',
  '$scope/linkCopied': 'link copied',
  '$scope/or': 'or',
  '$scope/developers': "developer\'s",
  '$scope/profile': 'profile',
};

main(List<String> args, SendPort port) {
  port.send({"strings": strings, "scope": scope});
}
