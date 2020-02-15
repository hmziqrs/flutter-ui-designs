import 'package:flutter/material.dart';

import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_uis/configs/Theme.dart' as theme;
import 'package:flutter_uis/configs/AppDimensions.dart';

import 'package:flutter_uis/blocs/ui_bloc/bloc.dart';

import 'package:flutter_uis/Utils.dart';
import 'package:flutter_uis/UI.dart';

import 'package:flutter_uis/Widgets/BorderButton/BorderButton.dart';
import 'package:flutter_uis/Widgets/Screen/Screen.dart';
import 'package:flutter_uis/Widgets/UICard/UICard.dart';

import 'Dimensions.dart';

class DesignerProfileScreen extends StatefulWidget {
  @override
  _DesignerProfileScreenState createState() => _DesignerProfileScreenState();
}

class _DesignerProfileScreenState extends State<DesignerProfileScreen>
    with SingleTickerProviderStateMixin {
  ScrollController scrollController;
  double scrollOffset = 0.0;
  final screenKey = GlobalKey<ScreenState>();

  @override
  void initState() {
    super.initState();

    this.scrollController = ScrollController();
    this.scrollController.addListener(() {
      final offset = this.scrollController.offset;
      setState(() {
        scrollOffset = -offset;
      });
    });
  }

  @override
  void dispose() {
    this.scrollController.dispose();
    super.dispose();
  }

  launchUrl(BuildContext ctx, String link) async {
    final check = await Utils.launchUrl(link);
    if (link != null && !check) {
      this.screenKey.currentState.showPopUp(
            title: "Error",
            message: "Platform cannot perform the action",
          );
    }
  }

  Widget renderCoverImage(UIDesigner designer) {
    double height = Dimensions.coverImageHeight + scrollOffset;

    if (height < 0) {
      height = 0;
    }

    return Container(
      transform: Matrix4.identity()..translate(0.0, -scrollOffset),
      height: height,
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
            color: primary,
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

  List<Widget> renderSocialMedia(BuildContext ctx, UIDesigner designer) {
    return [
      this.renderHeading("Follow me"),
      Wrap(
        children: [
          this.renderButton(
            'facebook',
            MaterialCommunityIcons.facebook,
            () => this.launchUrl(
              ctx,
              Utils.socialLink(designer.facebook, 'facebook'),
            ),
            enable: designer.facebook != null,
          ),
          this.renderButton(
            'instagram',
            MaterialCommunityIcons.instagram,
            () => this.launchUrl(
              ctx,
              Utils.socialLink(designer.instagram, 'instagram'),
            ),
            enable: designer.instagram != null,
          ),
          this.renderButton(
            'twitter',
            MaterialCommunityIcons.twitter,
            () => this.launchUrl(
              ctx,
              Utils.socialLink(designer.twitter, 'twitter'),
            ),
            enable: designer.twitter != null,
          ),
        ],
      ),
    ];
  }

  List<Widget> renderFreelance(BuildContext ctx, UIDesigner designer) {
    return [
      this.renderHeading("Hire me freelance"),
      Wrap(
        children: [
          this.renderButton(
            'Fiverr',
            MaterialCommunityIcons.briefcase_outline,
            () => this.launchUrl(
              ctx,
              Utils.socialLink(designer.fiverr, 'fiverr'),
            ),
            enable: designer.fiverr != null,
          ),
          this.renderButton(
            'Upwork',
            MaterialCommunityIcons.briefcase_outline,
            () => this.launchUrl(
              ctx,
              Utils.socialLink(designer.upwork, 'upwork'),
            ),
            enable: designer.upwork != null,
          ),
        ],
      ),
    ];
  }

  List<Widget> renderContactMe(BuildContext ctx, UIDesigner designer) {
    return [
      this.renderHeading("Contact me"),
      Wrap(
        children: [
          this.renderButton(
            'skype',
            MaterialCommunityIcons.skype_business,
            () => this.launchUrl(
              ctx,
              Utils.socialLink(designer.skype, 'skype'),
            ),
            enable: designer.skype != null,
          ),
          ...(designer.emails.length > 0
              ? designer.emails
                  .map(
                    (email) => this.renderButton(
                      email,
                      MaterialCommunityIcons.email_outline,
                      () => this.launchUrl(
                        ctx,
                        Utils.socialLink(email, 'email'),
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
                      () => this.launchUrl(
                        ctx,
                        Utils.socialLink(phone, 'phone'),
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

  List<Widget> renderPortfolio(BuildContext ctx, UIDesigner designer) {
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
                        () => this.launchUrl(
                          ctx,
                          Utils.socialLink(designer.website, 'website'),
                        ),
                        enable: hasWebsite,
                      )
                    : Container(),
                hasBehance
                    ? this.renderButton(
                        "Behance",
                        MaterialCommunityIcons.behance,
                        () => this.launchUrl(
                          ctx,
                          Utils.socialLink(designer.behance, 'behance'),
                        ),
                        enable: hasBehance,
                      )
                    : Container(),
                hasDribbble
                    ? this.renderButton(
                        "Dribbble",
                        MaterialCommunityIcons.dribbble,
                        () => this.launchUrl(
                          ctx,
                          Utils.socialLink(designer.dribbble, 'dribbble'),
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

    return BorderButton(
      color: color,
      maxWidth: 200.0,
      onPressed: callback,
      width: Dimensions.buttonWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: AppDimensions.padding / 2),
            child: Icon(
              icon,
              // size: 25,
              size: 12 * AppDimensions.ratio,
            ),
          ),
          Text(
            text,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 7 * AppDimensions.ratio,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
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
    BuildContext ctx,
    UIDesigner designer,
    List<UIItem> uiList,
  ) {
    double safeOffset = -scrollOffset;

    if (safeOffset > Dimensions.coverImageHeight) {
      safeOffset = Dimensions.coverImageHeight;
    }

    return Center(
      child: Container(
        transform: Matrix4.identity()..translate(0.0, safeOffset),
        width: AppDimensions.maxContainerWidth,
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
            ...this.renderSocialMedia(ctx, designer),
            Padding(padding: EdgeInsets.all(AppDimensions.padding)),
            ...this.renderPortfolio(ctx, designer),
            Padding(padding: EdgeInsets.all(AppDimensions.padding)),
            ...this.renderFreelance(ctx, designer),
            Padding(padding: EdgeInsets.all(AppDimensions.padding)),
            ...this.renderContactMe(ctx, designer),
            Padding(padding: EdgeInsets.all(AppDimensions.padding)),
            ...this.renderMoreUis(designer, uiList),
            Utils.safePadding(context, "bottom"),
            Padding(
              padding: EdgeInsets.only(top: safeOffset < 0 ? 0 : safeOffset),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Map obj = ModalRoute.of(context).settings.arguments;
    final String username = obj["designer"];

    return BlocProvider<UiBloc>(
      builder: (_) => UiBloc(),
      child: Screen(
        Dimensions.init,
        key: this.screenKey,
        builder: (showPopUp) => SingleChildScrollView(
          controller: this.scrollController,
          child: BlocBuilder<UiBloc, UiState>(
            builder: (blocCtx, state) {
              List<UIItem> uiList =
                  state.list.where((ui) => ui.designer == username).toList();
              UIDesigner designer = state.designers
                  .firstWhere((user) => user.username == username);

              return Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      this.renderCoverImage(designer),
                      this.renderContent(blocCtx, designer, uiList),
                    ],
                  ),
                  this.renderAvatar(designer),
                  Positioned(
                    top: MediaQuery.of(context).padding.top,
                    left: 0,
                    child: BackButton(
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
