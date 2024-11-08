import 'dart:isolate';

const String scope = 'AboutUserWidget';

const Map strings = {
  // Headings
  '$scope/skillSet': 'My Skill Set',
  '$scope/contacts': 'My Contacts',
  '$scope/followMe': 'Follow me',
  '$scope/likeProject': 'Like The Project?',
  '$scope/moreProjects': 'Explore More Projects',

  // Banners
  '$scope/contactsDesc':
      "I've shared my contacts strictly for business related queries ONLY.\nFor any Flutter related help post your query on Flutter Github, Flutter sub reddit & Flutter facebook groups",
  '$scope/likeProjectDesc':
      "Show support by performing any action listed below.",

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
