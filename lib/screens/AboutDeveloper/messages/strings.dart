import 'dart:isolate';

const String scope = 'AboutDeveloperScreen';

const Map strings = {
  // Title
  '$scope/title': 'About Developer',
  '$scope/intro': 'Full-stack engineer with over 7+ years of experience.',

  '$scope/skillSet': 'My Skill Set',
  '$scope/contacts': 'My Contacts',
  '$scope/contactsDesc':
      "I've shared my contacts strictly for business-related queries ONLY.\nFor any Flutter-related help, post your query on Flutter Github, Flutter subreddit & Flutter Facebook groups",
  '$scope/likeProject': 'Like The Project?',
  '$scope/likeProjectDesc':
      "Show support by performing any action listed below.",
  '$scope/moreProjects': 'Explore More Projects',

  // Projects
  '$scope/projectINVMovie1':
      "A static movie app featuring a heavily animated experience for ticket reservations.",
  '$scope/projectRNL': "React Native implementation of the puzzle game Loop.",
  '$scope/projectHCV':
      "My web-based resume built with HTML, CSS and JavaScript.",

  // actions
  '$scope/likeProject1': "Star this repository",
  '$scope/likeProject2': "Review this app on",
  '$scope/likeProject3': "Endorse my skills on",
  '$scope/likeProject4': "Favorite my gigs on",

  // singulars
  '$scope/share': 'Share',
  '$scope/copy': 'Copy',
  '$scope/open': 'Open',
  '$scope/linkCopied': 'Link copied',
  '$scope/or': 'or',
  '$scope/developers': "developer's",
  '$scope/profile': 'profile',
};

main(List<String> args, SendPort port) {
  port.send({"strings": strings, "scope": scope});
}
