import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_uis/configs/Theme.dart' as theme;

import 'package:flutter_uis/blocs/ui_bloc/bloc.dart';

import 'package:flutter_uis/Utils.dart';
import 'package:flutter_uis/UI.dart';

import 'package:flutter_uis/Widgets/UICard/UICard.dart';

// import 'Widgets/Card.dart';
import 'Dimensions.dart';

class UiListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => UiBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Theme(
          data: Theme.of(context).copyWith(
            primaryColor: theme.primary,
            accentColor: theme.primary,
            // textTheme: TextTheme(body1: Theme.of(context).textTheme.body1),
          ),
          child: OrientationBuilder(
            builder: (BuildContext ctx, Orientation orientation) {
              UI.init(ctx);
              Dimensions.init(ctx, orientation: orientation);

              return SafeArea(
                bottom: false,
                top: false,
                child: BlocBuilder<UiBloc, UiState>(
                  builder: (blocCtx, state) {
                    final List<UIItem> list = state.list;
                    return CustomScrollView(
                      slivers: <Widget>[
                        Utils.safePadding(ctx, 'top', true),
                        SliverPadding(
                          padding: EdgeInsets.only(
                            bottom: Dimensions.padding,
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.padding * 2,
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
                        SliverPadding(
                          padding: EdgeInsets.all(Dimensions.padding),
                          sliver: SliverGrid.count(
                            childAspectRatio:
                                Dimensions.cardWidth / Dimensions.cardHeight,
                            crossAxisCount: Dimensions.gridCount,
                            children: list
                                .map(
                                  (ui) => UICard(
                                    ui,
                                    padding: Dimensions.padding,
                                    cardWidth: Dimensions.cardWidth,
                                    cardHeight: Dimensions.cardHeight,
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        SliverPadding(
                          padding: EdgeInsets.all(Dimensions.padding * 1.5),
                        ),
                        // Utils.safePadding(context, 'bottom', true),
                      ],
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
