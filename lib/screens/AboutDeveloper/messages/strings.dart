import 'dart:isolate';

const String scope = 'AboutDeveloperScreen';

const Map strings = {
  // Title
  '$scope/title': 'About Developer',

  '$scope/desc1':
      "Hi, I am full stack developer who has been developing end to end smart solutions for more than three years.",
  '$scope/desc2':
      "I am a committed individual who is highly efficient and has excellent organizational skills to develop applications.",
  '$scope/desc3':
      "I help throughout the life cycle of an assigned project with my experience and ensure quality solutions that meet objectives.",
  '$scope/desc4':
      "With all that being said, I am very proud of the work I do, and will stop at nothing to make sure the job is done to 100% satisfaction.",

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
      "Implementation of complex movie booking UI concept featuring complex gesture based parallax animations",
  '$scope/projectRNL':
      "Simple and elegant clone \"Loop game\" in react native with just simple setState & contexts for shared state.",
  '$scope/projectHCV':
      "Simple crafting of my creativity and imagination into web version of CV/Resume with the help of Pug/Sass/JS. Which highlights my career journey",

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
