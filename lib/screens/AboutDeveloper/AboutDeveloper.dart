import 'package:flutter/material.dart';
import 'package:flutter_uis/Utils.dart';
import 'package:flutter_uis/Widgets/Screen/Screen.dart';

import 'package:flutter_uis/configs/Theme.dart' as theme;
import 'package:flutter_uis/configs/AppDimensions.dart';

import 'data.dart' as data;
import 'Dimensions.dart';

class AboutDeveloperScreen extends StatelessWidget {
  final screenKey = GlobalKey<ScreenState>();

  @override
  Widget build(BuildContext context) {
    return Screen(
      Dimensions.init,
      key: this.screenKey,
      scaffoldBackgroundColor: theme.darkBackground,
      builder: (_) => SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            this.buildContent(context),
            this.buildAvatar(),
            this.buildBackButton(context),
          ],
        ),
      ),
    );
  }

  Widget buildContent(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyText1.copyWith(
          color: Colors.white,
        );

    return Column(
      children: <Widget>[
        Container(
          height: Dimensions.redBackground,
          decoration: BoxDecoration(
            color: theme.primary,
            boxShadow: [
              BoxShadow(
                color: theme.primary.withOpacity(0.4),
                blurRadius: 10,
                spreadRadius: 3,
              ),
            ],
          ),
        ),
        Container(
          child: Center(
            child: Container(
              padding: EdgeInsets.all(AppDimensions.padding * 2),
              width: double.infinity,
              constraints: BoxConstraints(
                maxWidth: AppDimensions.maxContainerWidth,
              ),
              child: DefaultTextStyle(
                style: textStyle,
                child: this.buildBody(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildBody() {
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
            "Hi, I am Hamza freelance developer. I have been building end to end smart solutions for my clients for more than three years. When a client hire me I don't offer just my skills I offer them my experience. I help them at every stage of product development such as prototyping wireframes, improving UI designs, timelined development, quality assurance, project deployment & feedback based changes." +
                "\n\nFor developement I use latest technologies, Modularized project structure for flexible, readable & easy to maintain code. Performance optimised best practices. Automated build process with production & debug enviroments.",
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
            top: AppDimensions.padding * 3,
          ),
          child: Text(
            "Let's Chat !",
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
                          this.screenKey.currentState.showPopUp();
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
                            padding:
                                EdgeInsets.only(right: AppDimensions.padding),
                            child: Icon(contact["icon"], color: Colors.white),
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
            top: AppDimensions.padding * 3,
          ),
          child: Text(
            "Show Support",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: AppDimensions.padding,
            top: AppDimensions.padding,
          ),
          child: Text(
            "If you like the project and want to appreciate my effort. Then please click any of these links and perform any action you may like.",
            style: TextStyle(
              fontSize: 8 + AppDimensions.ratio * 4,
              // fontWeight: FontWeight.w300,
              color: Colors.white.withOpacity(0.55),
            ),
          ),
        ),
        this.buildShowSupportList(),
      ],
    );
  }

  Widget buildShowSupportList() {
    return Padding(
      padding: EdgeInsets.only(
        top: AppDimensions.padding * 2,
        left: AppDimensions.padding * 1,
        right: AppDimensions.padding * 1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: data.showSupport
            .map(
              (support) => GestureDetector(
                onTap: () => Utils.launchUrl(support["link"]),
                child: Text(
                  "* ${support["text"]}",
                  style: TextStyle(
                    height: 1 + AppDimensions.ratio * 0.5,
                    fontSize: 10 + AppDimensions.ratio * 5,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget buildAvatar() {
    final borderWidth = AppDimensions.ratio * 8;
    return Positioned(
      left: 0,
      right: 0,
      top: (Dimensions.redBackground -
          (Dimensions.avatarSize / 2) -
          borderWidth / 2),
      child: Container(
        child: Stack(
          children: <Widget>[
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Dimensions.avatarSize),
                child: Container(
                  width: Dimensions.avatarSize + borderWidth,
                  height: Dimensions.avatarSize + borderWidth,
                  child: Column(
                    children: <Widget>[
                      Flexible(child: Container(color: theme.darkBackground)),
                      Flexible(child: Container(color: theme.primary)),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: borderWidth / 2,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: Dimensions.avatarSize,
                  child: CircleAvatar(
                    radius: Dimensions.avatarSize / 2,
                    backgroundImage: AssetImage("assets/user/hamza.jpg"),
                    backgroundColor: theme.primary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBackButton(context) {
    return Positioned(
      child: Padding(
        padding: Utils.safePaddingUnit(context, "all"),
        child: BackButton(),
      ),
    );
  }
}
