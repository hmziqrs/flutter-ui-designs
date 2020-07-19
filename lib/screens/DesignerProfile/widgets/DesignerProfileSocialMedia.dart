import 'package:flutter/material.dart';
import 'package:flutter_uis/configs/App.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:flutter_uis/statics/models/UIDesigner.dart';
import 'package:flutter_uis/Utils.dart';

import 'DesignerProfileHeading.dart';
import 'DesignerProfileButton.dart';
import '../messages/keys.dart';

class DesignerProfileSocialMedia extends StatelessWidget {
  DesignerProfileSocialMedia({
    @required this.designer,
  });

  final UIDesigner designer;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DesignerProfileHeading(
          App.translate(
            DesignerProfileScreenMessages.follow,
          ),
        ),
        Wrap(
          children: [
            DesignerProfileButton(
              label: 'facebook',
              enable: designer.facebook != null,
              icon: MaterialCommunityIcons.facebook,
              onPress: () => Utils.launchSocialLink(
                designer.facebook,
                'facebook',
              ),
            ),
            DesignerProfileButton(
              label: 'instagram',
              enable: designer.instagram != null,
              icon: MaterialCommunityIcons.instagram,
              onPress: () => Utils.launchSocialLink(
                designer.instagram,
                'instagram',
              ),
            ),
            DesignerProfileButton(
              label: 'twitter',
              enable: designer.twitter != null,
              icon: MaterialCommunityIcons.twitter,
              onPress: () => Utils.launchSocialLink(
                designer.twitter,
                'twitter',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
