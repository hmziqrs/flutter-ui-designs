
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_uis/configs/Ads.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/AppTheme.dart';
import 'package:flutter_uis/configs/App.dart';
import 'package:flutter_uis/configs/TextStyles.dart';

import 'package:flutter_uis/statics/models/UIItem.dart';
import 'package:flutter_uis/utils/Utils.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'UIDetailSupport.dart';
import 'UIDetailMoreUIs.dart';
import 'UIDetailButton.dart';

import '../messages/keys.dart';
import '../TestKeys.dart';
import '../Provider.dart';

class UIDetailContent extends StatefulWidget {
  UIDetailContent({
    required this.uiItem,
  });

  final UIItem uiItem;

  @override
  _UIDetailContentState createState() => _UIDetailContentState();
}

class _UIDetailContentState extends State<UIDetailContent> {
  InterstitialAd? ad;
  @override
  void initState() {
    super.initState();
    this.initAd();
  }

  void initAd() {
    if (!App.showAds) return;
    InterstitialAd.load(
      adUnitId: Ads.interstitialUIDetail(),
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (loadedAd) {
          // Keep a reference to the ad so you can show it later.
          this.ad = loadedAd;
          this.ad!.fullScreenContentCallback = FullScreenContentCallback(
            onAdShowedFullScreenContent: (InterstitialAd ad) {},
            onAdDismissedFullScreenContent: (InterstitialAd ad) {},
            onAdFailedToShowFullScreenContent:
                (InterstitialAd ad, AdError error) {},
            onAdImpression: (InterstitialAd ad) {
              this.navigate();
              this.initAd();
            },
          );
          setState(() {});
        },
        onAdFailedToLoad: (LoadAdError error) {
          this.ad = null;
        },
      ),
    );
  }

  void openApp(BuildContext context) {
    final r = Random().nextInt(3);
    final adCheck = App.showAds && this.ad != null;
    if (r == 2 && adCheck) {
      this.ad!.show();
      return;
    }

    this.navigate();
  }

  void navigate() {
    Navigator.of(context).pushNamed(
      widget.uiItem.miniApp!,
    );
  }

  @override
  build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: AppDimensions.maxContainerWidth,
        ),
        padding: EdgeInsets.all(AppDimensions.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.padding,
              ),
              child: Text(
                widget.uiItem.name,
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
                "${App.translate(UIDetailScreenMessages.by, context)} ${widget.uiItem.designer}",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
              ),
            ),
            widget.uiItem.description != null
                ? Container(
                    margin: EdgeInsets.only(top: AppDimensions.padding),
                    padding: EdgeInsets.symmetric(
                      horizontal: AppDimensions.padding,
                    ),
                    child: Text(
                      widget.uiItem.description!,
                      style: TextStyles.body26.copyWith(
                        color: AppTheme.subText2,
                      ),
                    ),
                  )
                : SizedBox(),
            Padding(padding: EdgeInsets.all(AppDimensions.padding)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIDetailButton(
                  testKey: UIDetailScreenTestKeys.openApp,
                  text: App.translate(
                    UIDetailScreenMessages.openApp,
                    context,
                  ),
                  callback: () => this.openApp(context),
                ),
                UIDetailButton(
                  testKey: UIDetailScreenTestKeys.viewSource,
                  text: App.translate(
                    UIDetailScreenMessages.viewSource,
                    context,
                  ),
                  callback: () async {
                    await Utils.launchUrl(widget.uiItem.link);
                  },
                ),
              ],
            ),
            UIDetailSupport(uiItem: widget.uiItem),
            Padding(padding: EdgeInsets.all(AppDimensions.padding)),
            UIDetailMoreUIs(uiItem: widget.uiItem),
            widget.uiItem.designer != "anonymous"
                ? UIDetailButton(
                    testKey: UIDetailScreenTestKeys.viewDesigner,
                    text:
                        "${App.translate(UIDetailScreenMessages.contact, context)} ${widget.uiItem.designer}",
                    callback: () async {
                      final screenState = UIDetailStateProvider.state(context);
                      await screenState.hide();
                      await Navigator.of(context).pushNamed(
                        "designerProfile",
                        arguments: {
                          "designer": widget.uiItem.designer,
                          "id": widget.uiItem.id,
                        },
                      );
                      await screenState.dDelayD;
                      UIDetailStateProvider.state(context).show();
                    },
                  )
                : Container(),
            Utils.safePadding(context, 'bottom'),
          ],
        ),
      ),
    );
  }
}
