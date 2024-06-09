import 'package:flutter/material.dart';
import 'package:flutter_uis/configs/Ads.dart';
import 'package:flutter_uis/configs/App.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/AppTheme.dart';
import 'package:flutter_uis/configs/CommonProps.dart';
import 'package:flutter_uis/configs/TextStyles.dart';
import 'package:flutter_uis/widgets/Screen/Provider.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../data.dart' as data;
import '../messages/keys.dart';

class HomeBody extends StatefulWidget {
  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  BannerAd? ad;
  @override
  void initState() {
    super.initState();
    if (!App.showAds) return;
    BannerAd(
      adUnitId: Ads.bannerHome(),
      size: AdSize.largeBanner,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ladedAd) {
          setState(() {
            this.ad = ladedAd as BannerAd;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    ).load();
  }

  onPress(BuildContext context, String path) {
    if (path == 'settings') {
      return ScreenStateProvider.state(context).setSettingsOpen(true);
    }
    Navigator.of(context).pushNamed(
      path,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          maxWidth: AppDimensions.maxContainerWidth,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.padding * 2,
          vertical: AppDimensions.padding * 2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              App.translate(
                HomeScreenMessages.title,
                context,
              ),
              key: Key("title"),
              style: TextStyles.heading1,
            ),
            Text(
              App.translate(
                HomeScreenMessages.desc,
                context,
              ),
              style: TextStyle(
                fontSize: 16,
                color: AppTheme.text.withOpacity(0.8),
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(padding: EdgeInsets.all(AppDimensions.padding)),
            ...data.list.map(
              (item) {
                if (item["key"] == 'ad') {
                  if (!App.showAds || this.ad == null) {
                    return SizedBox();
                  }
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: AppDimensions.padding * 1,
                    ),
                    child: Container(
                      height: this.ad!.size.height.toDouble(),
                      alignment: Alignment.center,
                      child: AdWidget(ad: this.ad!),
                    ),
                  );
                }
                return Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: AppDimensions.padding * 1,
                  ),
                  child: InkWell(
                    key: Key(item["key"]! as String),
                    borderRadius: CommonProps.buttonRadius,
                    onTap: () => this.onPress(context, item["path"] as String),
                    child: Ink(
                      padding: EdgeInsets.symmetric(
                        vertical: AppDimensions.padding * 1.5,
                      ),
                      width: double.infinity,
                      decoration: CommonProps.borderButton,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            item["icon"] as IconData,
                            size: 20,
                            color: AppTheme.primary,
                          ),
                          Container(width: AppDimensions.padding),
                          Text(
                            App.translate(
                              item["label"] as String,
                              context,
                            ),
                            style: TextStyles.body16
                                .copyWith(
                              color: AppTheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ).toList(),
          ],
        ),
      ),
    );
  }
}
