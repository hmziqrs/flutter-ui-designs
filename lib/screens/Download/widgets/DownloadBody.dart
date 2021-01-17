import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_uis/configs/Ads.dart';
import 'package:supercharged/supercharged.dart';
import 'package:share/share.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/App.dart';

import 'package:flutter_uis/utils/Utils.dart';

import 'package:flutter_uis/widgets/BottomSheets/WithBoxButtons.dart';
import 'package:flutter_uis/widgets/SnackBars/Base.dart';
import 'package:flutter_uis/widgets/Banners/Alpha.dart';
import 'package:flutter_uis/widgets/Buttons/Alpha.dart';
import 'package:flutter_uis/widgets/Header/Header.dart';

import 'DownloadHeading.dart';

import '../messages/keys.dart';
import '../data.dart' as data;
import '../Dimensions.dart';

class DownloadBody extends StatelessWidget {
  void onTap(BuildContext context, Map map) {
    final str = ["web", "github", "play store"].where(
      (element) => element == map["name"].toString().toLowerCase(),
    );

    final makeOpen = str.length == 1;
    final isMobile = Utils.isMobile();
    final label1 = App.translate(
      isMobile ? DownloadScreenMessages.share : DownloadScreenMessages.copy,
      context,
    );
    final label2 = App.translate(
      makeOpen ? DownloadScreenMessages.open : DownloadScreenMessages.download,
      context,
    );

    final icon1 = isMobile
        ? MaterialCommunityIcons.share_variant
        : MaterialCommunityIcons.content_copy;
    final icon2 =
        makeOpen ? MaterialCommunityIcons.web : MaterialCommunityIcons.download;

    showBottomSheetWithBoxButtons(
      context: context,
      appInit: Dimensions.init,
      button1: (bottomSheetContext) async {
        if (isMobile) {
          Share.share(map["url"], subject: map["name"]);
        } else {
          Clipboard.setData(
            ClipboardData(
              text: map["url"].toString(),
            ),
          );
          Navigator.pop(bottomSheetContext);
          await 200.milliseconds.delay;
          ScaffoldMessenger.of(context).hideCurrentSnackBar(
            reason: SnackBarClosedReason.dismiss,
          );
          showSnackBarBase(
            context: context,
            text:
                "${map["name"]} ${App.translate(DownloadScreenMessages.linkCopied, context)}",
          );
        }
      },
      button2: (_) => Utils.launchUrl(map["url"]),
      title: "$label2 or $label1 ${map["name"]} url",
      label1: label1,
      label2: label2,
      icon1: icon1,
      icon2: icon2,
    );
  }

  Widget mapButton(context, Map obj) {
    final buttonMargin = EdgeInsets.only(
      top: AppDimensions.padding * 2,
      left: AppDimensions.padding * 2,
      right: AppDimensions.padding * 2,
    );

    return AlphaButton(
      onTap: () => this.onTap(context, obj),
      icon: obj["icon"],
      margin: buttonMargin,
      label: obj["name"].toString().toUpperCase(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Header(label: App.translate(DownloadScreenMessages.title, context)),
        // Content

        AlphaBanner(text: App.translate(DownloadScreenMessages.desc, context)),
        SizedBox(height: AppDimensions.padding * 2),
        if (App.showAds)
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppDimensions.padding * 1,
            ),
            child: Center(
              child: AdmobBanner(
                adSize: AdmobBannerSize.SMART_BANNER(context),
                adUnitId: Ads.getDownloadScreenBanner(),
              ),
            ),
          ),
        //Mobile
        DownloadHeading(label: DownloadScreenMessages.mobile),
        ...data.mobileLinks.map((obj) => this.mapButton(context, obj)).toList(),
        SizedBox(height: AppDimensions.padding * 2),

        // Desktop
        DownloadHeading(label: DownloadScreenMessages.desktop),
        ...data.desktopLinks
            .map((obj) => this.mapButton(context, obj))
            .toList(),
        SizedBox(height: AppDimensions.padding * 2),

        // Web
        DownloadHeading(label: DownloadScreenMessages.web),
        ...data.webLinks.map((obj) => this.mapButton(context, obj)).toList(),
        SizedBox(height: AppDimensions.padding * 2),
        Utils.safePadding(context, "bottom"),
      ],
    );
  }
}
