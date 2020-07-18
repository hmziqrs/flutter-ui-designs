import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:flutter_uis/statics/models/UIItem.dart';

import 'messages/keys.dart';

final getSupportList = (UIItem uiItem) => [
      {
        "label": UIDetailScreenMessages.landscape,
        "icon": MaterialCommunityIcons.phone_rotate_landscape,
        "flag": uiItem.landscapeSupport,
      },
      {
        "label": UIDetailScreenMessages.tablet,
        "icon": MaterialCommunityIcons.tablet,
        "flag": uiItem.tabletSupport,
      },
      {
        "label": UIDetailScreenMessages.android,
        "icon": MaterialCommunityIcons.android,
        "flag": true,
      },
      {
        "label": UIDetailScreenMessages.ios,
        "icon": MaterialCommunityIcons.apple,
        "flag": true,
      },
      {
        "label": UIDetailScreenMessages.web,
        "icon": MaterialCommunityIcons.web,
        "flag": uiItem.webSupport,
      },
      {
        "label": UIDetailScreenMessages.desktop,
        "icon": MaterialCommunityIcons.desktop_mac,
        "flag": uiItem.desktopSupport,
      },
    ];
