import 'package:flutter/material.dart';

import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:url_launcher/url_launcher.dart' as url;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_uis/blocs/ui_bloc/bloc.dart';

import 'package:flutter_uis/configs/Theme.dart' as theme;
import 'package:flutter_uis/configs/AppDimensions.dart';

import 'package:flutter_uis/Utils.dart';

import 'package:flutter_uis/Widgets/UICard/UICard.dart';

import 'Dimensions.dart';

class UiDetailScreen extends StatelessWidget {
  Widget renderCoverImage(UIItem uiItem) {
    return Hero(
      transitionOnUserGestures: true,
      tag: "thumbnail-${uiItem.id}",
      child: Container(
        height: Dimensions.coverImageHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage(uiItem.thumbnail),
            fit: BoxFit.cover,
          ),
          // color: Colors.red,
        ),
      ),
    );
  }

  renderButton(
    String text,
    Function callback, {
    double width = double.infinity,
    int flex = 1,
  }) {
    return Flexible(
      flex: flex,
      child: Container(
        width: width,
        margin: EdgeInsets.all(AppDimensions.padding),
        padding: EdgeInsets.all(AppDimensions.padding),
        child: RaisedButton(
          elevation: 0.0,
          color: Colors.white,
          textColor: theme.primary,
          highlightElevation: 0.0,
          padding: EdgeInsets.symmetric(
            vertical: AppDimensions.padding * 2,
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: theme.primary, width: 2),
            borderRadius: BorderRadius.circular(4.0),
          ),
          onPressed: callback,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 7 * AppDimensions.ratio,
              fontWeight: FontWeight.w600,
            ),
          ),
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
                fontSize: 4 * AppDimensions.ratio,
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
    return Center(
      child: Container(
        // width: 100,
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
            Padding(padding: EdgeInsets.all(AppDimensions.padding)),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    bool can = await url.canLaunch(uiItem.link);
                    if (can) {
                      await url.launch(uiItem.link);
                    } else {
                      print("ERROR");
                    }
                  },
                ),
              ],
            ),
            this.renderSupport(uiItem),
            Padding(padding: EdgeInsets.all(AppDimensions.padding)),
            ...this.renderMoreUis(uiItem, list),
            Row(
              children: <Widget>[
                Flexible(child: Container()),
                this.renderButton(
                  "Contact ${uiItem.designer}",
                  () => Navigator.of(context).pushReplacementNamed(
                    "designerProfile",
                    arguments: uiItem.designer,
                  ),
                  flex: 5,
                ),
                Flexible(child: Container()),
              ],
            ),
            Utils.safePadding(context, 'bottom'),
            // this.renderDesignerProfile(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final UIItem uiItem = ModalRoute.of(context).settings.arguments;

    return OrientationBuilder(
      builder: (BuildContext ctx, Orientation orientation) {
        Dimensions.init(ctx, orientation);

        return BlocProvider(
          builder: (context) => UiBloc(),
          child: Scaffold(
            extendBodyBehindAppBar: false,
            body: Theme(
              data: Theme.of(context).copyWith(
                primaryColor: theme.primary,
                accentColor: theme.primary,
              ),
              child: SingleChildScrollView(
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
                      child: BackButton(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
