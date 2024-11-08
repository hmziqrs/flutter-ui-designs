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

import 'package:flutter_uis/widgets/Buttons/Alpha.dart';
import 'package:flutter_uis/widgets/Banners/Alpha.dart';
import 'package:flutter_uis/widgets/Header/Header.dart';

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
    return Column(
      children: [
        Header(
          label: AboutDeveloperScreenMessages.title,
        ),
        Expanded(
          child: Container(
            width: AppDimensions.maxContainerWidth,
            child: ListView(
              key: Key(AboutDeveloperTestKeys.rootScroll),
              padding: EdgeInsets.zero,
              children: <Widget>[

                SizedBox(height: AppDimensions.padding * 1),
                AboutUserName(name: "Hamza Iqbal"),
                AboutUserJobTitle(
                  label: "Full stack engineer | Rust, Flutter & React Native",
                ),
                SizedBox(height: AppDimensions.padding * 1),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimensions.padding * 2,
                  ),
                  child: Text(
                    App.translate(AboutDeveloperScreenMessages.intro, context),
                  ),
                ),
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
                ...data.contacts
                    .map(
                      (contact) => AboutUserContactButton(
                        url: contact["url"] as String?,
                        icon: contact["icon"] as IconData,
                        label: contact["label"] as String,
                        initContext: Dimensions.init,
                        platform: contact["platform"] as String,
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
                Utils.safePadding(context, 'bottom'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
