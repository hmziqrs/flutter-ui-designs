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
              "Hi, I am full stack developer who has been developing end to end smart solutions for more than three years. I am a committed individual who is highly efficient and has excellent organisational skills to develop applications. I help throughout the life cycle of an assigned project with my experience and ensure quality solutions that meet objectives. With all that being said, I am very proud of the work I do, and will stop at nothing to make sure the job is done to 100% satisfaction."),
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
        Container(
          decoration: BoxDecoration(),
          padding: EdgeInsets.only(
            left: AppDimensions.padding,
            top: AppDimensions.padding,
            bottom: AppDimensions.padding * 2,
          ),
          child: Text(
            "NOTE: These contact links are not any kind of flutter helpline. I shared my contacts only for buisness related inquiries.\n\nAny help related query will not be entertain. For any help/answer follow docs or post your query on stackoverflow & community group.",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white.withOpacity(0.5),
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
            "If you like the project and want to appreciate my effort. Then click any of these links below and perform the action.",
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
