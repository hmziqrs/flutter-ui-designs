import 'package:flutter/material.dart';
import 'package:flutter_uis/configs/App.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:flutter_uis/statics/models/UIDesigner.dart';
import 'package:flutter_uis/utils/Utils.dart';

import 'DesignerProfileHeading.dart';
import 'DesignerProfileButton.dart';
import '../messages/keys.dart';

class DesignerProfilePortfolio extends StatelessWidget {
  DesignerProfilePortfolio({@required this.designer});

  final UIDesigner designer;

  @override
  Widget build(BuildContext context) {
    bool hasWebsite = designer.website != null;
    bool hasBehance = designer.behance != null;
    bool hasDribbble = designer.dribbble != null;
    bool hasAny = hasWebsite || hasBehance || hasDribbble;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: hasAny
          ? [
              DesignerProfileHeading(
                App.translate(
                  DesignerProfileScreenMessages.portfolio,
                  context,
                ),
              ),
              Wrap(
                children: [
                  hasWebsite
                      ? DesignerProfileButton(
                          label: "Website",
                          icon: MaterialCommunityIcons.web,
                          onPress: () => Utils.launchSocialLink(
                            designer.website,
                            'website',
                          ),
                          enable: hasWebsite,
                        )
                      : Container(),
                  hasBehance
                      ? DesignerProfileButton(
                          label: "Behance",
                          icon: MaterialCommunityIcons.behance,
                          onPress: () => Utils.launchSocialLink(
                            designer.behance,
                            'behance',
                          ),
                          enable: hasBehance,
                        )
                      : Container(),
                  hasDribbble
                      ? DesignerProfileButton(
                          label: "Dribbble",
                          icon: MaterialCommunityIcons.dribbble,
                          onPress: () => Utils.launchSocialLink(
                            designer.dribbble,
                            'dribbble',
                          ),
                          enable: hasDribbble,
                        )
                      : Container(),
                ],
              ),
            ]
          : [Container()],
    );
  }
}
