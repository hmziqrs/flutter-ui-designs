import 'package:flutter_icons/flutter_icons.dart';

import 'package:flutter_uis/statics/Links.dart';

import 'messages/keys.dart';

final devDescription = [
  AboutDeveloperScreenMessages.desc1,
  AboutDeveloperScreenMessages.desc2,
  AboutDeveloperScreenMessages.desc3,
  AboutDeveloperScreenMessages.desc4,
];

final skills = [
  "HTML/CSS",
  "Pug(Jade)",
  "Sass/Less",
  "Javascript",
  "JQuery",
  "React JS",
  "React SSR",
  "Redux",
  "Redux Saga",
  "React Native",
  "Dart",
  "Flutter",
  "Firebase",
  "Photoshop",
  "Basic UI designs",
  "Node JS",
  "Express JS",
  "MYSQL",
  "Mongo DB",
  "Socket.IO",
  "Go lang",
  "Dart Server",
  "Automation Scripting",
];

final contacts = [
  {
    "platform": "facebook",
    "label": "hackerhgl",
    "icon": MaterialCommunityIcons.facebook,
  },
  {
    "platform": "linkedin",
    "label": "hackerhgl",
    "icon": MaterialCommunityIcons.linkedin,
  },
  {
    "platform": "gmail",
    "label": "hamza.iqdev@gmail.com",
    "icon": MaterialCommunityIcons.gmail,
    "url": "mailto:hamza.iqdev@gmail.com",
  },
  {
    "platform": "skype",
    "label": "hamza.iqbal.jawaid.iqbal",
    "icon": MaterialCommunityIcons.skype_business,
    "url": "https://join.skype.com/invite/XGRknTea0kKf",
  },
  {
    "platform": "whatsapp",
    "label": "+923148155304",
    "icon": MaterialCommunityIcons.whatsapp
  },
];

final showSupport = [
  {
    "label": AboutDeveloperScreenMessages.likeProject1,
    "icon": MaterialCommunityIcons.github_face,
    "link": MyLinks.fudGithub,
  },
  {
    "platform": "Play Store",
    "label": AboutDeveloperScreenMessages.likeProject2,
    "icon": MaterialCommunityIcons.google_play,
    "link": MyLinks.fudGooglePlay,
  },
  {
    "platform": "Linkedin",
    "label": AboutDeveloperScreenMessages.likeProject3,
    "icon": MaterialCommunityIcons.linkedin,
    "link": "https://www.linkedin.com/in/hackerhgl/",
  },
  {
    "platform": "Fiverr",
    "label": AboutDeveloperScreenMessages.likeProject4,
    "icon": MaterialCommunityIcons.heart_outline,
    "link": "https://www.fiverr.com/hackerhgl",
  },
];

final moreProjects = [
  {
    "label": "Flutter Movie Concept UI",
    "desc": AboutDeveloperScreenMessages.projectINVMovie1,
    "links": [
      {
        "label": "Google Play",
        "icon": MaterialCommunityIcons.google_play,
        "url": MyLinks.invmovie1GooglePlay,
      },
      {
        "label": "Github",
        "icon": MaterialCommunityIcons.github_face,
        "url": MyLinks.invmovie1GooglePlay,
      },
    ],
  },
  {
    "label": "React Native Loop",
    "desc": AboutDeveloperScreenMessages.projectRNL,
    "links": [
      {
        "label": "Google Play",
        "icon": MaterialCommunityIcons.google_play,
        "url": MyLinks.rnLoopGooglePlay,
      },
      {
        "label": "Github",
        "icon": MaterialCommunityIcons.github_face,
        "url": MyLinks.rnLoopGithub,
      },
    ],
  },
  {
    "label": "Hackerhgl CV",
    "desc": AboutDeveloperScreenMessages.projectHCV,
    "links": [
      {
        "label": "Website",
        "icon": MaterialCommunityIcons.web,
        "url": MyLinks.hackerhglCVWeb,
      },
      {
        "label": "Github",
        "icon": MaterialCommunityIcons.github_face,
        "url": MyLinks.hackerhglCVGithub,
      },
    ],
  },
];
