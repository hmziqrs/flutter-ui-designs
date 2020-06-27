import 'dart:isolate';

const String scope = 'AboutDeveloperScreen';

const Map strings = {
  '$scope/title': 'About App',
  '$scope/job': 'Full stack web and app developer',
  '$scope/description':
      'Hi, I am full stack developer who has been developing end to end smart solutions for more than three years. I am a committed individual who is highly efficient and has excellent organisational skills to develop applications. I help throughout the life cycle of an assigned project with my experience and ensure quality solutions that meet objectives. With all that being said, I am very proud of the work I do, and will stop at nothing to make sure the job is done to 100% satisfaction.',
  '$scope/skillSet': 'My skill set',
  '$scope/letsChat': "Let's Chat !",
  '$scope/note':
      "NOTE: These contact links are not any kind of flutter helpline. I shared my contacts only for buisness related inquiries.\n\nAny help related query will not be entertain. For any help or answer follow docs and post your query on stackoverflow and community group.",
  '$scope/support': 'Show Support',
  '$scope/supportDescription':
      'If you like the project and want to appreciate my effort. Then click any of these links below and perform the action.',
  '$scope/stepGit': "Star this github repository",
  '$scope/stepStore': "Rate this app on playstore",
  '$scope/stepEndorse': "Endorse my skills on my Linkedin",
  '$scope/stepFiver': "Favorite my gigs on fiver",
  '$scope/stepFreelancer': "Give a recommendation on freelancer",
};

main(List<String> args, SendPort port) {
  port.send({"strings": strings, "scope": scope});
}
