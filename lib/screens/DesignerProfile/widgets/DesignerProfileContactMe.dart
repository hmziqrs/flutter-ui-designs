import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:flutter_uis/statics/models/UIDesigner.dart';
import 'package:flutter_uis/configs/App.dart';
import 'package:flutter_uis/Utils.dart';

import 'DesignerProfileHeading.dart';
import 'DesignerProfileButton.dart';
import '../messages/keys.dart';

class DesignerProfileContactMe extends StatelessWidget {
  DesignerProfileContactMe({@required this.designer});

  final UIDesigner designer;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DesignerProfileHeading(
          App.translate(
            DesignerProfileScreenMessages.contactMe,
          ),
        ),
        Wrap(
          children: [
            DesignerProfileButton(
              label: 'skype',
              enable: designer.skype != null,
              icon: MaterialCommunityIcons.skype_business,
              onPress: () => Utils.launchSocialLink(designer.skype, 'skype'),
            ),
            ...(designer.emails.length > 0
                ? designer.emails
                    .map(
                      (email) => DesignerProfileButton(
                        label: email,
                        enable: true,
                        icon: MaterialCommunityIcons.email_outline,
                        onPress: () => Utils.launchSocialLink(email, 'email'),
                      ),
                    )
                    .toList()
                : [Container()]),
            ...(designer.phone.length > 0
                ? designer.phone
                    .map(
                      (phone) => DesignerProfileButton(
                        label: phone,
                        enable: true,
                        icon: MaterialCommunityIcons.phone_outline,
                        onPress: () => Utils.launchSocialLink(phone, 'phone'),
                      ),
                    )
                    .toList()
                : [Container()]),
          ],
        ),
      ],
    );
  }
}
