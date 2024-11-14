import 'package:flutter_font_icons/flutter_font_icons.dart';

import 'package:flutter_uis/statics/Links.dart';

import 'messages/keys.dart';


final skills = [
  "Rust",
  "Flutter",
  "React Native",
  "NextJS",
  "Typescript",
  "Firebase",
  "NodeJS",
  "PostgresSQL",
];

const username = "hmziqrs";
const email = "$username@gmail.com";
const web = "https://hmziq.rs";

final contacts = [
  {
    "platform": "twitter",
    "label": "@$username",
    "icon": MaterialCommunityIcons.twitter,
    "url": "https://x.com/$username",
  },
  {
    "platform": "linkedin",
    "label": "/in/$username",
    "icon": MaterialCommunityIcons.linkedin,
    "url": "https://linkedin.com/in/$username",
  },
  {
    "platform": "gmail",
    "label": "$email",
    "icon": MaterialCommunityIcons.gmail,
    "url": "mailto:$email",
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
];

final moreProjects = [
  {
    "label": "Flutter Movie Concept UI",
    "desc": AboutDeveloperScreenMessages.projectINVMovie1,
    "links": [
      {
        "label": "Google Play",
        "icon": MaterialCommunityIcons.google_play,
        "url": MyLinks.invmovie1Github,
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
      {
        "label": "Github",
        "icon": MaterialCommunityIcons.web,
        "url": MyLinks.rnLoopGithub,
      },
    ],
  },
  {
    "label": "Epic Gandalf Sax Infinite",
    "desc": AboutDeveloperScreenMessages.projectGandalf,
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
    "label": "hmziqrs CV",
    "desc": AboutDeveloperScreenMessages.projectHCV,
    "links": [
      {
        "label": "Website",
        "icon": MaterialCommunityIcons.web,
        "url": MyLinks.myCVWeb,
      },
      {
        "label": "Github",
        "icon": MaterialCommunityIcons.github,
        "url": MyLinks.myCVGithub,
      },
    ],
  },
];
