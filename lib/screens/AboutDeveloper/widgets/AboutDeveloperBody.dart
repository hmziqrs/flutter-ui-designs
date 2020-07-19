import 'package:flutter/material.dart';

import 'package:flutter_uis/configs/Theme.dart' as theme;
import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/App.dart';
import 'package:flutter_uis/Utils.dart';

import 'AboutDeveloperShowSupport.dart';
import '../messages/keys.dart';
import '../data.dart' as data;
import '../Dimensions.dart';

class AboutDeveloperBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(height: Dimensions.avatarSize / 2),
        Padding(
          padding: EdgeInsets.only(
            left: AppDimensions.padding,
            right: AppDimensions.padding,
            top: AppDimensions.padding * 3,
          ),
          child: Text(
            App.translate(AboutDeveloperScreenMessages.title),
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: AppDimensions.padding,
            right: AppDimensions.padding,
            top: AppDimensions.padding,
          ),
          child: Text(
            App.translate(AboutDeveloperScreenMessages.description),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: AppDimensions.padding,
            right: AppDimensions.padding,
            top: AppDimensions.padding * 3,
          ),
          child: Text(
            App.translate(AboutDeveloperScreenMessages.skillSet),
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: AppDimensions.padding,
          ),
          child: Wrap(
            children: data.skills
                .map(
                  (skill) => Container(
                    margin: EdgeInsets.all(AppDimensions.padding * 1),
                    padding: EdgeInsets.symmetric(
                      vertical: AppDimensions.padding,
                      horizontal: AppDimensions.padding * 2,
                    ),
                    decoration: BoxDecoration(
                      color: theme.darkBackground,
                      borderRadius: BorderRadius.circular(4.0),
                      border: Border.all(
                        width: 1,
                        color: theme.primary,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: theme.primary.withOpacity(0.5),
                          blurRadius: 3,
                        ),
                      ],
                    ),
                    child: Text(
                      skill,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: AppDimensions.padding,
            right: AppDimensions.padding,
            top: AppDimensions.padding * 3,
          ),
          child: Text(
            App.translate(AboutDeveloperScreenMessages.letsChat),
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(),
          padding: EdgeInsets.only(
            left: AppDimensions.padding,
            right: AppDimensions.padding,
            top: AppDimensions.padding,
            bottom: AppDimensions.padding * 2,
          ),
          child: Text(
            App.translate(AboutDeveloperScreenMessages.note),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white.withOpacity(0.5),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.padding,
          ),
          child: Column(
            children: data.contacts
                .map(
                  (contact) => Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: AppDimensions.padding),
                    child: OutlineButton(
                      onPressed: () async {
                        final check = await Utils.launchUrl(Utils.socialLink(
                          contact["username"],
                          contact["platform"],
                        ));
                        if (!check) {
                          // this.screenKey.currentState.showPopUp();
                        }
                      },
                      padding: EdgeInsets.symmetric(
                        vertical: AppDimensions.padding * 1.2,
                      ),
                      color: theme.primary,
                      textColor: theme.primary,
                      highlightedBorderColor: theme.primary,
                      borderSide: BorderSide(
                        color: theme.primary.withOpacity(0.7),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppDimensions.padding,
                            ),
                            child: Icon(
                              contact["icon"],
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            (["facebook", "instagram", "linkedin"]
                                        .contains(contact["platform"])
                                    ? "@"
                                    : "") +
                                contact["username"],
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: AppDimensions.padding,
            right: AppDimensions.padding,
            top: AppDimensions.padding * 3,
          ),
          child: Text(
            App.translate(AboutDeveloperScreenMessages.support),
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: AppDimensions.padding,
            right: AppDimensions.padding,
            top: AppDimensions.padding,
          ),
          child: Text(
            App.translate(AboutDeveloperScreenMessages.supportDescription),
            style: TextStyle(
              fontSize: 8 + AppDimensions.ratio * 4,
              color: Colors.white.withOpacity(0.55),
            ),
          ),
        ),
        AboutDeveloperShowSupport(),
      ],
    );
  }
}
