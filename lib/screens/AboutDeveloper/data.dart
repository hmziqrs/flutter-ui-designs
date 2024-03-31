import 'package:flutter_font_icons/flutter_font_icons.dart';

import 'package:flutter_uis/statics/Links.dart';

import 'messages/keys.dart';


final skills = [
  "NextJS",
  "ReactJS",
  "Flutter",
  "React Native",
  "Javascript",
  "Typescript",
  "Firebase",
  "Rust",
  "NodeJS",
  "MongoDB",
  "PostgresSQL",
];

final contacts = [
  {
    "platform": "facebook",
    "label": "facebook.com/hackerhgl",
    "icon": MaterialCommunityIcons.facebook,
  },
  {
    "platform": "linkedin",
    "label": "linkedin.com/in/hackerhgl",
    "icon": MaterialCommunityIcons.linkedin,
  },
  {
    "platform": "gmail",
    "label": "hamza.iqdev@gmail.com",
    "icon": MaterialCommunityIcons.gmail,
    "url": "mailto:hamza.iqdev@gmail.com",
  },
];

final showSupport = [
  {
    "label": AboutDeveloperScreenMessages.likeProject1,
    "icon": MaterialCommunityIcons.github,
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
        "icon": MaterialCommunityIcons.github,
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
        "icon": MaterialCommunityIcons.github,
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
        "icon": MaterialCommunityIcons.github,
        "url": MyLinks.hackerhglCVGithub,
      },
    ],
  },
];
