import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_uis/Widgets/Screen/Screen.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';

import 'package:flutter_uis/blocs/ui_bloc/bloc.dart';

import 'package:flutter_uis/Utils.dart';

import 'package:flutter_uis/Widgets/UICard/UICard.dart';

import 'Dimensions.dart';

class UiListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UiBloc(),
      child: Screen(
        Dimensions.init,
        builder: (_) => SafeArea(
          bottom: false,
          top: false,
          child: BlocBuilder<UiBloc, UiState>(
            builder: (blocContext, state) {
              final List<UIItem> list = state.list;
              return CustomScrollView(
                slivers: <Widget>[
                  Utils.safePadding(blocContext, 'top', true),
                  SliverPadding(
                    padding: EdgeInsets.all(AppDimensions.padding),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDimensions.padding * 3,
                      ),
                      child: Text(
                        "Explore UIs",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDimensions.padding * 3,
                      ),
                      // child: Text(
                      //   '''Card/ Width:${Dimensions.cardWidth} Height:${Dimensions.cardHeight}\n UI/ Tab:${UI.isTablet} \n Tab:${Device.get().isTablet} iX:${Device.get().isIphoneX}\nScreen/ Width:${UI.getSize().width} Height:${UI.getSize().height}\nApp/ Ratio:${AppDimensions.ratio} Density:${UI.mediaQuery().devicePixelRatio}''',
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.w700,
                      //   ),
                      // ),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.all(AppDimensions.padding),
                    sliver: SliverToBoxAdapter(
                      child: Wrap(
                        children: list
                            .map(
                              (ui) => UICard(
                                ui,
                                padding: AppDimensions.padding * 2,
                                cardWidth: Dimensions.cardWidth,
                                cardHeight: Dimensions.cardHeight,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.all(AppDimensions.padding * 3),
                  ),
                  Utils.safePadding(context, 'bottom', true),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
