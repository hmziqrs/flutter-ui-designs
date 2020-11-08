import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/TextStyles.dart';
import 'package:flutter_uis/configs/App.dart';

import 'messages/keys.dart';

final map = {
  "skills": AboutUserWidgetMessages.skillSet,
  "contacts": AboutUserWidgetMessages.contacts,
  "likeProject": AboutUserWidgetMessages.likeProject,
  "moreProjects": AboutUserWidgetMessages.moreProjects,
};

class AboutUserHeading extends StatelessWidget {
  AboutUserHeading({
    @required this.label,
    this.isMapped = true,
  });

  final String label;
  final bool isMapped;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.padding * 2,
      ),
      child: Text(
        this.isMapped ? App.translate(map[this.label], context) : this.label,
        style: TextStyles.heading4,
      ),
    );
  }
}
