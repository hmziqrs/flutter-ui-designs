import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/App.dart';

import 'package:flutter_uis/widgets/Screen/Screen.dart';

import 'widgets/HFDHomeScreenRestaurantSlider.dart';
import 'widgets/HFDHomeScreenCategories.dart';
import 'widgets/HFDHomeScreenItemCard.dart';
import 'widgets/HFDHomeScreenFilters.dart';

import '../../configs/theme.dart' as theme;
import 'messages/keys.dart';
import 'data.dart' as data;
import 'Dimensions.dart';
import 'TestKeys.dart';
import 'Provider.dart';

class HFDHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HFDHomeState>(
      create: (_) => HFDHomeState(),
      child: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);

    return Container(
      child: Screen(
        theme: Theme.of(context).copyWith(
          primaryColor: theme.primary,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: theme.primary),
        ),
        fontFamily: 'Nunito',
        bottomNavigationBar: Selector<HFDHomeState, int>(
            selector: (_, state) => state.activeTab,
            builder: (context, activeTab, child) {
              return BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: activeTab,
                selectedItemColor: theme.primary,
                unselectedItemColor: Colors.black,
                onTap: (index) {
                  HFDHomeState.state(context).setActiveTab(index);
                },
                items: data.bottomNavList.map(
                  (item) {
                    return BottomNavigationBarItem(
                    icon: Stack(
                      children: [
                        Icon(item),
                        Positioned(
                          bottom: 0,
                          child: Padding(
                            padding: EdgeInsets.all(0),
                            child: Container(
                              width: 30,
                              height: 4,
                              transform: Matrix4.identity()
                                ..translate(0.0, 4.0),
                              decoration: BoxDecoration(
                                color: (data.bottomNavList[activeTab] == item
                                    ? theme.primary
                                    : Colors.transparent),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                            ),
                          ),
                        )
                      ],
                      ),
                    );
                  },
                ).toList(),
              );
          },
        ),
        textStyle: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(fontFamily: 'Nunito'),
        child: SafeArea(
          top: false,
          child: ListView(
            key: Key(HFDHomeScreenTestKeys.rootScroll),
            children: <Widget>[
              // Header
              Padding(
                padding: EdgeInsets.all(AppDimensions.padding * 2),
                child: Row(
                  children: <Widget>[
                    Text(
                      App.translate(
                        HFDHomeScreenMessages.title,
                        context,
                      ),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Flexible(child: Container()),
                    InkWell(
                      onTap: () {},
                      child: Icon(MaterialIcons.search),
                    )
                  ],
                ),
              ),
              // Filter Bar
              HFDHomeScreenFilters(),
              // Build horizontal carousel slider
              Container(
                margin: EdgeInsets.only(
                  top: AppDimensions.padding * 4,
                  bottom: AppDimensions.padding * 4,
                ),
                // height: 340,
                height: Dimensions.itemBaseHeight,
                child: ListView.builder(
                  key: Key(HFDHomeScreenTestKeys.foodItemsScroll),
                  itemCount: data.items.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    final item = data.items[index];

                    return HFDHomeScreenItemCard(
                      item,
                    );
                  },
                ),
              ),
              HFDHomeScreenCategories(),
              Container(
                padding: EdgeInsets.only(
                  top: AppDimensions.padding * 4,
                  left: AppDimensions.padding * 2,
                ),
                child: Text(
                  App.translate(
                    HFDHomeScreenMessages.topRestaurants,
                    context,
                  ),
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              HFDHomeScreenRestaurantSlider(),
            ],
          ),
        ),
      ),
    );
  }
}
