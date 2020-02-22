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
              padding: EdgeInsets.all(AppDimensions.padding),
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
            "Hi, I'm Hamza freelance developer. I've been developing end to end solutions from backend services to web apps & mobile apps for more than two years. I use latest sate of the art technologies & implement flexible code architectrue so it's easy to understand & some of the code base could be use in different projects as well.\n\n" +
                "Besides all the technical stuff I like to spend my free time by playing Clash Royale & Rise of Kingdoms, Watch anime, k-drama, movie & read book sometime.",
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

  Widget buildAvatar() {
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
          backgroundColor: theme.primary,
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
