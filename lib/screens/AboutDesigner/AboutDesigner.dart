import 'package:flutter/material.dart';
import 'package:flutter_uis/Utils.dart';

import 'package:flutter_uis/configs/Theme.dart' as theme;
import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'Dimensions.dart';

class AboutDesignerScreen extends StatelessWidget {
  final skills = [
    "HTML",
    "CSS",
    "Javascript",
    "JQuery",
    "React JS",
    "React SSR",
    "Redux",
    "React Native",
    "Dart",
    "Flutter",
    "Firebase",
    "Photoshop",
    "Basic UI designs",
    "Node JS",
    "Express JS",
    "MYSQL",
    "Socket.IO",
    "Go lang",
    "Dart Server",
  ];

  final contacts = [
    {
      "platform": "facebook",
      "username": "hackerhgl",
      "icon": MaterialCommunityIcons.facebook,
    },
    {
      "platform": "instagram",
      "username": "hackerhgl",
      "icon": MaterialCommunityIcons.instagram,
    },
    {
      "platform": "skype",
      "username": "hamza.iqbal.jawaid.iqbal",
      "icon": MaterialCommunityIcons.skype_business
    },
    {
      "platform": "whatsapp",
      "username": "+923148155304",
      "icon": MaterialCommunityIcons.whatsapp
    },
  ];

  Widget renderContent(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.body1.copyWith(
          color: Colors.white,
        );

    return Column(
      children: <Widget>[
        Container(
          height: Dimensions.redBackground,
          decoration: BoxDecoration(color: theme.primary, boxShadow: [
            BoxShadow(
              // color: theme.primary,
              color: theme.primary.withOpacity(0.4),
              blurRadius: 10,
              spreadRadius: 3,
            ),
          ]),
        ),
        Container(
          // decoration: BoxDecoration(
          //   color: theme.darkBackground,
          // ),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(AppDimensions.padding),
              width: double.infinity,
              constraints: BoxConstraints(
                maxWidth: AppDimensions.maxContainerWidth,
              ),
              child: DefaultTextStyle(
                style: textStyle,
                child: this.renderBody(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget renderBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(height: Dimensions.avatarSize / 2),
        Padding(
          padding: EdgeInsets.only(
            left: AppDimensions.padding,
            top: AppDimensions.padding * 3,
          ),
          child: Text(
            "Full stack web & app developer",
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
            "Hi, I'm Hamza freelance developer. I've been developing end to end solutions from backend services to web app & mobile apps for two years. I Always use latest sate of the art technologies & implement flexible & readable code architectrue so most of the code can be use in different projects as well.\n\n" +
                "Besides all the technical stuff I like to spend my free time by playing Clash Royale & Rise of Kingdoms, Watch anime, dramas & movies. I'm not the fan of reading books.",
            style: TextStyle(),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: AppDimensions.padding,
            top: AppDimensions.padding * 3,
          ),
          child: Text(
            "My skill set",
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
            children: this
                .skills
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
            top: AppDimensions.padding * 3,
          ),
          child: Text(
            "Wanna hire me ?",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            right: AppDimensions.padding,
            left: AppDimensions.padding,
          ),
          child: Column(
            children: this
                .contacts
                .map(
                  (contact) => Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: AppDimensions.padding),
                    child: OutlineButton(
                      onPressed: () => Utils.launchUrl(Utils.soicalLink(
                        contact["username"],
                        contact["platform"],
                      )),
                      padding: EdgeInsets.symmetric(
                          vertical: AppDimensions.padding * 1.2),
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
                            padding:
                                EdgeInsets.only(right: AppDimensions.padding),
                            child: Icon(contact["icon"], color: Colors.white),
                          ),
                          Text(
                            (["facebook", "instagram"]
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
        )
      ],
    );
  }

  Widget renderAvatar() {
    return Positioned(
      left: 0,
      right: 0,
      top: (Dimensions.redBackground - (Dimensions.avatarSize / 2)),
      child: Container(
        alignment: Alignment.center,
        width: Dimensions.avatarSize,
        height: Dimensions.avatarSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              blurRadius: 12,
              spreadRadius: 3,
              color: Colors.white.withOpacity(0.18),
            ),
          ],
        ),
        child: CircleAvatar(
          radius: Dimensions.avatarSize / 2,
          backgroundImage: AssetImage("assets/user/hamza.jpg"),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext buildCtx) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        Dimensions.init(context, orientation);

        return Scaffold(
          backgroundColor: theme.darkBackground,
          body: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                this.renderContent(context),
                this.renderAvatar(),
              ],
            ),
          ),
        );
      },
    );
  }
}
