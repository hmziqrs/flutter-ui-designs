import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/AppTheme.dart';
import 'package:flutter_uis/configs/App.dart';

import 'package:flutter_uis/utils/Utils.dart';

import 'package:flutter_uis/widgets/AboutUser/AboutUserContactButton.dart';
import 'package:flutter_uis/widgets/AboutUser/AboutUserJobTitle.dart';
import 'package:flutter_uis/widgets/AboutUser/AboutUserHeading.dart';
import 'package:flutter_uis/widgets/AboutUser/AboutUserSkills.dart';
import 'package:flutter_uis/widgets/AboutUser/AboutUserName.dart';
import 'package:flutter_uis/widgets/AboutUser/AboutUserBio.dart';

import 'package:flutter_uis/widgets/Buttons/Alpha.dart';
import 'package:flutter_uis/widgets/Header/Header.dart';
import 'package:flutter_uis/widgets/Banners/Alpha.dart';

import 'AboutDeveloperMoreProjects.dart';

import '../messages/keys.dart';
import '../data.dart' as data;
import '../Dimensions.dart';
import '../TestKeys.dart';

class AboutDeveloperBody extends StatelessWidget {
  Widget mapSupportButton(
    BuildContext context,
    Map obj,
  ) {
    final buttonMargin = EdgeInsets.only(
      top: AppDimensions.padding * 2,
      left: AppDimensions.padding * 2,
      right: AppDimensions.padding * 2,
    );
    final prefix = obj["platform"];

    String label = obj["label"].toString();

    if (prefix != null) {
      label = App.translate(label) + " " + prefix;
    }

    return AlphaButton(
      icon: obj["icon"],
      margin: buttonMargin,
      label: (App.translate(label, context)).toUpperCase(),
      onTap: () => Utils.launchUrl(obj["link"]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        width: AppDimensions.maxContainerWidth,
        child: ListView(
          key: Key(AboutDeveloperTestKeys.rootScroll),
          padding: EdgeInsets.zero,
          children: <Widget>[
            Header(
              label: AboutDeveloperScreenMessages.title,
            ),
            SizedBox(height: AppDimensions.padding * 1),
            AboutUserName(name: "Hamza Iqbal"),
            AboutUserJobTitle(
              label: "Full Stack, React Native & Flutter Developer",
            ),
            AboutUserBio(points: data.devDescription),
            SizedBox(height: AppDimensions.padding * 3),
            Container(height: 1, color: AppTheme.subText3.withOpacity(0.1)),
            SizedBox(height: AppDimensions.padding * 2),
            AboutUserHeading(
              label: "skills",
            ),
            SizedBox(height: AppDimensions.padding * 1),
            AboutUserSkills(
              skills: data.skills,
            ),
            SizedBox(height: AppDimensions.padding * 2),
            Container(height: 1, color: AppTheme.subText3.withOpacity(0.1)),
            SizedBox(height: AppDimensions.padding * 2),
            AboutUserHeading(label: "contacts"),
            SizedBox(height: AppDimensions.padding * 2),
            AlphaBanner(
              text: App.translate(
                AboutDeveloperScreenMessages.contactsDesc,
                context,
              ),
            ),
            SizedBox(height: AppDimensions.padding * 1),
            ...data.contacts
                .map(
                  (contact) => AboutUserContactButton(
                    url: contact["url"],
                    icon: contact["icon"],
                    label: contact["label"],
                    initContext: Dimensions.init,
                    platform: contact["platform"],
                  ),
                )
                .toList(),
            SizedBox(height: AppDimensions.padding * 3),
            Container(height: 1, color: AppTheme.subText3.withOpacity(0.1)),
            SizedBox(height: AppDimensions.padding * 2),
            AboutUserHeading(
              label: "likeProject",
            ),
            SizedBox(height: AppDimensions.padding * 2),
            AlphaBanner(
              text: App.translate(
                AboutDeveloperScreenMessages.likeProjectDesc,
                context,
              ),
            ),
            SizedBox(height: AppDimensions.padding * 1),
            ...data.showSupport
                .map(
                  (obj) => this.mapSupportButton(context, obj),
                )
                .toList(),
            SizedBox(height: AppDimensions.padding * 3),
            Container(height: 1, color: AppTheme.subText3.withOpacity(0.1)),
            SizedBox(height: AppDimensions.padding * 2),
            AboutUserHeading(
              label: "moreProjects",
            ),
            SizedBox(height: AppDimensions.padding * 1),
            AboutDeveloperMoreProjects(),
          ],
        ),
      ),
    );
  }
}
