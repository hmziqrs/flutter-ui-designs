import 'package:flutter/material.dart';

import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_uis/configs/Theme.dart' as theme;
import 'package:flutter_uis/configs/AppDimensions.dart';

import 'package:flutter_uis/blocs/ui_bloc/bloc.dart';

import 'package:flutter_uis/Utils.dart';
import 'package:flutter_uis/UI.dart';

import 'package:flutter_uis/Widgets/UICard/UICard.dart';

import 'Dimensions.dart';

class DesignerProfileScreen extends StatelessWidget {
  Widget renderCoverImage(UIDesigner designer) {
    return Container(
      height: Dimensions.coverImageHeight,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage(designer.cover),
          fit: BoxFit.cover,
        ),
        // color: Colors.red,
      ),
    );
  }

  Widget renderAvatar(UIDesigner designer) {
    double left = AppDimensions.padding * 2;

    if (UI.width.floor() - AppDimensions.padding * 2 >
        AppDimensions.maxContainerWidth) {
      left = (UI.width - AppDimensions.maxContainerWidth) / 2;
    }

    return Positioned(
      top: Dimensions.coverImageHeight - (Dimensions.avatarSize / 2),
      left: left,
      child: Container(
        width: Dimensions.avatarSize,
        height: Dimensions.avatarSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black,
          border: Border.all(
            width: AppDimensions.padding,
            // color: Colors.white,
            color: theme.primary,
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 12,
              spreadRadius: 8,
              color: Colors.white,
              // color: theme.primary,
            )
          ],
        ),
        child: Center(
          child: Text(
            "${designer.username}",
            style: TextStyle(
              fontSize: Dimensions.avatarSize * 0.15,
              // color: theme.primary,
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }

  Widget renderHeading(String text) {
    return Padding(
      padding: EdgeInsets.all(AppDimensions.padding),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  List<Widget> renderSocialMedia(UIDesigner designer) {
    return [
      this.renderHeading("Follow me"),
      Wrap(
        children: [
          this.renderButton(
            'facebook',
            MaterialCommunityIcons.facebook,
            () => Utils.launchUrl(
              Utils.soicalLink(designer.facebook, 'facebook'),
            ),
            enable: designer.facebook != null,
          ),
          this.renderButton(
            'instagram',
            MaterialCommunityIcons.instagram,
            () => Utils.launchUrl(
              Utils.soicalLink(designer.instagram, 'instagram'),
            ),
            enable: designer.instagram != null,
          ),
          this.renderButton(
            'twitter',
            MaterialCommunityIcons.twitter,
            () => Utils.launchUrl(
              Utils.soicalLink(designer.twitter, 'twitter'),
            ),
            enable: designer.twitter != null,
          ),
        ],
      ),
    ];
  }

  List<Widget> renderFreelance(UIDesigner designer) {
    return [
      this.renderHeading("Hire me freelance"),
      Wrap(
        children: [
          this.renderButton(
            'Fiverr',
            MaterialCommunityIcons.briefcase_outline,
            () => Utils.launchUrl(
              Utils.soicalLink(designer.fiverr, 'fiverr'),
            ),
            enable: designer.fiverr != null,
          ),
          this.renderButton(
            'Upwork',
            MaterialCommunityIcons.briefcase_outline,
            () => Utils.launchUrl(
              Utils.soicalLink(designer.upwork, 'upwork'),
            ),
            enable: designer.upwork != null,
          ),
        ],
      ),
    ];
  }

  List<Widget> renderContactMe(UIDesigner designer) {
    return [
      this.renderHeading("Contact me"),
      Wrap(
        children: [
          this.renderButton(
            'skype',
            MaterialCommunityIcons.skype_business,
            () => Utils.launchUrl(
              Utils.soicalLink(designer.skype, 'skype'),
            ),
            enable: designer.skype != null,
          ),
          ...(designer.emails.length > 0
              ? designer.emails
                  .map(
                    (email) => this.renderButton(
                      email,
                      MaterialCommunityIcons.email_outline,
                      () => Utils.launchUrl(
                        Utils.soicalLink(email, 'email'),
                      ),
                      enable: true,
                    ),
                  )
                  .toList()
              : [Container()]),
          ...(designer.phone.length > 0
              ? designer.phone
                  .map(
                    (phone) => this.renderButton(
                      phone,
                      MaterialCommunityIcons.phone_outline,
                      () => Utils.launchUrl(
                        Utils.soicalLink(phone, 'phone'),
                      ),
                      enable: true,
                    ),
                  )
                  .toList()
              : [Container()]),
        ],
      ),
    ];
  }

  List<Widget> renderPortfolio(UIDesigner designer) {
    bool hasWebsite = designer.website != null;
    bool hasBehance = designer.behance != null;
    bool hasDribbble = designer.dribbble != null;
    bool hasAny = hasWebsite || hasBehance || hasDribbble;
    return hasAny
        ? [
            this.renderHeading("My Portfolio"),
            Wrap(
              children: [
                hasWebsite
                    ? this.renderButton(
                        "Website",
                        MaterialCommunityIcons.web,
                        () => Utils.launchUrl(
                          Utils.soicalLink(designer.website, 'website'),
                        ),
                        enable: hasWebsite,
                      )
                    : Container(),
                hasBehance
                    ? this.renderButton(
                        "Behance",
                        MaterialCommunityIcons.behance,
                        () => Utils.launchUrl(
                          Utils.soicalLink(designer.behance, 'behance'),
                        ),
                        enable: hasBehance,
                      )
                    : Container(),
                hasDribbble
                    ? this.renderButton(
                        "Dribbble",
                        MaterialCommunityIcons.dribbble,
                        () => Utils.launchUrl(
                          Utils.soicalLink(designer.dribbble, 'dribbble'),
                        ),
                        enable: hasDribbble,
                      )
                    : Container(),
              ],
            ),
          ]
        : [];
  }

  renderButton(
    String text,
    IconData icon,
    Function callback, {
    bool enable = false,
  }) {
    Color color = enable ? theme.primary : Colors.black.withOpacity(0.3);

    final screenSize = UI.width;
    final max = AppDimensions.maxContainerWidth;

    final width = screenSize > max ? max : screenSize;

    double buttonWidth =
        ((width - (AppDimensions.padding * 4)) / 2) - AppDimensions.padding * 2;

    if (screenSize > max) {
      buttonWidth = (width / 3) - ((AppDimensions.padding * 3) + 6);
    }

    return Container(
      width: buttonWidth,
      margin: EdgeInsets.all(AppDimensions.padding),
      child: RaisedButton(
        elevation: 0.0,
        color: Colors.white,
        textColor: color,
        highlightElevation: 0.0,
        padding: EdgeInsets.symmetric(
          vertical: AppDimensions.padding * 1.4,
          horizontal: AppDimensions.padding * 2,
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: color, width: 2),
          borderRadius: BorderRadius.circular(4.0),
        ),
        onPressed: enable ? callback : () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: AppDimensions.padding / 2),
              child: Icon(icon),
            ),
            Flexible(
              child: Container(
                child: Text(
                  text,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> renderMoreUis(UIDesigner designer, List<UIItem> uiList) {
    return [
      Padding(
        padding: EdgeInsets.all(AppDimensions.padding),
        child: Text(
          "Explore UIs",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: uiList
              .map((ui) => UICard(
                    ui,
                    isMini: true,
                    padding: AppDimensions.padding * 2,
                    cardWidth: Dimensions.cardWidth,
                    cardHeight: Dimensions.cardHeight,
                  ))
              .toList(),
        ),
      )
    ];
  }

  Widget renderContent(
    BuildContext context,
    UIDesigner designer,
    List<UIItem> uiList,
  ) {
    return Center(
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          maxWidth: AppDimensions.maxContainerWidth,
        ),
        padding: EdgeInsets.all(AppDimensions.padding * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: Dimensions.avatarSize / 2,
                left: AppDimensions.padding,
              ),
              child: Text(
                designer.name,
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            designer.description != null
                ? Padding(
                    padding: EdgeInsets.fromLTRB(
                      AppDimensions.padding,
                      AppDimensions.padding,
                      AppDimensions.padding,
                      0,
                    ),
                    child: Text(
                      designer.description,
                      style: TextStyle(
                        // fontSize: 28.0,
                        color: Colors.black.withOpacity(0.45),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                : Container(),
            Padding(padding: EdgeInsets.all(AppDimensions.padding)),
            ...this.renderSocialMedia(designer),
            Padding(padding: EdgeInsets.all(AppDimensions.padding)),
            ...this.renderPortfolio(designer),
            Padding(padding: EdgeInsets.all(AppDimensions.padding)),
            ...this.renderFreelance(designer),
            Padding(padding: EdgeInsets.all(AppDimensions.padding)),
            ...this.renderContactMe(designer),
            Padding(padding: EdgeInsets.all(AppDimensions.padding)),
            ...this.renderMoreUis(designer, uiList),
            Utils.safePadding(context, "bottom"),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String username = ModalRoute.of(context).settings.arguments;

    return OrientationBuilder(
      builder: (BuildContext ctx, Orientation orientation) {
        Dimensions.init(ctx, orientation);

        return BlocProvider(
          builder: (context) => UiBloc(),
          child: Scaffold(
            body: Theme(
              data: Theme.of(context).copyWith(
                primaryColor: theme.primary,
                accentColor: theme.primary,
              ),
              child: SingleChildScrollView(
                child: BlocBuilder<UiBloc, UiState>(
                  builder: (context, state) {
                    List<UIItem> uiList = state.list
                        .where((ui) => ui.designer == username)
                        .toList();
                    UIDesigner designer = state.designers
                        .firstWhere((user) => user.username == username);

                    return Stack(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            this.renderCoverImage(designer),
                            this.renderContent(context, designer, uiList),
                          ],
                        ),
                        this.renderAvatar(designer),
                        Positioned(
                          top: MediaQuery.of(context).padding.top,
                          left: 0,
                          child: BackButton(),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
