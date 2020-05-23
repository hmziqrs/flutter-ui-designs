import 'package:flutter/material.dart';

import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_uis/blocs/ui_bloc/bloc.dart';

import 'package:flutter_uis/configs/Theme.dart' as theme;
import 'package:flutter_uis/configs/AppDimensions.dart';

import 'package:flutter_uis/Utils.dart';

import 'package:flutter_uis/Widgets/BorderButton/BorderButton.dart';
import 'package:flutter_uis/Widgets/Screen/Screen.dart';
import 'package:flutter_uis/Widgets/UICard/UICard.dart';

import 'Dimensions.dart';

class UiDetailScreen extends StatefulWidget {
  @override
  _UiDetailScreenState createState() => _UiDetailScreenState();
}

class _UiDetailScreenState extends State<UiDetailScreen>
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

  Widget renderCoverImage(UIItem uiItem) {
    double height = Dimensions.coverImageHeight + scrollOffset;

    if (height < 0) {
      height = 0;
    }

    return Hero(
      transitionOnUserGestures: true,
      tag: "thumbnail-${uiItem.id}",
      child: Container(
        transform: Matrix4.identity()..translate(0.0, -scrollOffset),
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage(uiItem.thumbnail),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  renderButton(
    String text,
    Function callback,
  ) {
    return BorderButton(
      maxWidth: 200,
      onPressed: callback,
      color: theme.primary,
      width: Dimensions.buttonWidth,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 7.5 * AppDimensions.ratio,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget renderSupport(UIItem uiItem) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppDimensions.padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(AppDimensions.padding),
            child: Text(
              "Platform & Screens",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(AppDimensions.padding)),
          Row(
            children: [
              this.renderSupportBox(
                "Landscape",
                MaterialCommunityIcons.phone_rotate_landscape,
                uiItem.landscapeSupport,
              ),
              this.renderSupportBox(
                "Tablet",
                MaterialCommunityIcons.tablet,
                uiItem.tabletSupport,
              ),
              this.renderSupportBox(
                "Android",
                MaterialCommunityIcons.android,
                true,
              ),
              this.renderSupportBox(
                "iOS",
                MaterialCommunityIcons.apple,
                true,
              ),
              this.renderSupportBox(
                "Web",
                MaterialCommunityIcons.web,
                uiItem.webSupport,
              ),
              this.renderSupportBox(
                "Desktop",
                MaterialCommunityIcons.desktop_mac,
                uiItem.desktopSupport,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget renderSupportBox(String label, IconData icon, bool enable) {
    final color = enable == true ? theme.primary : Colors.grey;
    return Flexible(
      child: Center(
        child: Column(
          children: <Widget>[
            Icon(
              icon,
              color: color,
              size: 24,
            ),
            Padding(padding: EdgeInsets.only(top: 4)),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 5 * AppDimensions.ratio,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> renderMoreUis(UIItem uiItem, List<UIItem> list) {
    final moreUis = list
        .where((ui) => ui.id != uiItem.id && ui.designer == uiItem.designer);
    if (moreUis.length == 0) {
      return [Container()];
    }
    return [
      Padding(
        padding: EdgeInsets.all(AppDimensions.padding),
        child: Text(
          "More UIs from ${uiItem.designer}",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: moreUis
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

  renderContent(BuildContext context, UIItem uiItem, List<UIItem> list) {
    double safeOffset = -scrollOffset;

    if (safeOffset > Dimensions.coverImageHeight) {
      safeOffset = Dimensions.coverImageHeight;
    }
    return Center(
      child: Container(
        transform: Matrix4.identity()..translate(0.0, safeOffset),
        constraints: BoxConstraints(
          maxWidth: AppDimensions.maxContainerWidth,
        ),
        padding: EdgeInsets.all(AppDimensions.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.padding,
              ),
              child: Text(
                uiItem.name,
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.padding,
              ),
              child: Text(
                "By ${uiItem.designer}",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
              ),
            ),
            (uiItem.description != null
                ? Container(
                    margin: EdgeInsets.only(top: AppDimensions.padding),
                    padding: EdgeInsets.symmetric(
                      horizontal: AppDimensions.padding,
                    ),
                    child: Text(
                      uiItem.description,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).textTheme.bodyText2.color,
                      ),
                    ),
                  )
                : Container()),
            Padding(padding: EdgeInsets.all(AppDimensions.padding)),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                this.renderButton(
                  "Open App",
                  () => Navigator.of(context).pushNamed(
                    uiItem.miniApp,
                  ),
                ),
                this.renderButton(
                  "View UI Source",
                  () async {
                    bool link = await Utils.launchUrl(uiItem.link);
                    if (!link) {
                      this.screenKey.currentState.showPopUp();
                    }
                  },
                ),
              ],
            ),
            this.renderSupport(uiItem),
            Padding(padding: EdgeInsets.all(AppDimensions.padding)),
            ...this.renderMoreUis(uiItem, list),
            uiItem.designer != "anonymous"
                ? this.renderButton(
                    "Contact ${uiItem.designer}",
                    () => Navigator.of(context).pushNamed(
                      "designerProfile",
                      arguments: {"designer": uiItem.designer, "id": uiItem.id},
                    ),
                  )
                : Container(),
            Padding(
              padding: EdgeInsets.only(top: safeOffset < 0 ? 0 : safeOffset),
            ),
            Utils.safePadding(context, 'bottom'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final UIItem uiItem = ModalRoute.of(context).settings.arguments;

    return Screen(
      Dimensions.init,
      key: this.screenKey,
      builder: (_) {
        return BlocProvider(
          create: (_) => UiBloc(),
          child: SingleChildScrollView(
            controller: this.scrollController,
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    this.renderCoverImage(uiItem),
                    BlocBuilder<UiBloc, UiState>(
                      builder: (context, state) {
                        List<UIItem> list = state.list;
                        return this.renderContent(
                          context,
                          uiItem,
                          list,
                        );
                      },
                    ),
                  ],
                ),
                Positioned(
                  top: MediaQuery.of(context).padding.top +
                      AppDimensions.padding,
                  left: AppDimensions.padding,
                  child: BackButton(
                    onPressed: () => Navigator.of(context).popUntil(
                      ModalRoute.withName("uiList"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
