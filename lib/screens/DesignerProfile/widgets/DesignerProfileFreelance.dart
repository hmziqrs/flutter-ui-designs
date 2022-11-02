import 'package:flutter/material.dart';
import 'package:flutter_uis/configs/App.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:flutter_uis/statics/models/UIDesigner.dart';
import 'package:flutter_uis/utils/Utils.dart';

import 'DesignerProfileHeading.dart';
import 'DesignerProfileButton.dart';
import '../messages/keys.dart';

class DesignerProfileFreelance extends StatelessWidget {
  DesignerProfileFreelance({required this.designer});

  final UIDesigner designer;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DesignerProfileHeading(
          App.translate(
            DesignerProfileScreenMessages.hireMe,
            context,
          ),
        ),
        Wrap(
          children: [
            DesignerProfileButton(
              label: 'Fiverr',
              enable: designer.fiverr != null,
              icon: MaterialCommunityIcons.briefcase_outline,
              onPress: () => Utils.launchSocialLink(designer.fiverr, 'fiverr'),
            ),
            DesignerProfileButton(
              label: 'Upwork',
              enable: designer.upwork != null,
              icon: MaterialCommunityIcons.briefcase_outline,
              onPress: () => Utils.launchSocialLink(designer.upwork, 'upwork'),
            ),
          ],
        ),
      ],
    );
  }
}
