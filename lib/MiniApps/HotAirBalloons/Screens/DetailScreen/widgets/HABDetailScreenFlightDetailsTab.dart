import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/App.dart';

import 'package:flutter_uis/UI.dart';

import '../../../configs/theme.dart' as theme;
import '../../../data/flights.dart' as data;
import '..//messages/keys.dart';

import 'HABDetailScreenRowInfo.dart';

class HABDetailScreenFlightDetailsTab extends StatelessWidget {
  HABDetailScreenFlightDetailsTab(this.flight);
  final data.HABFlight flight;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        HABDetailScreenRowInfo(
          App.translate(HABDetailScreenMessages.basketSize),
          App.translate(flight.basketSize),
          Feather.users,
        ),
        HABDetailScreenRowInfo(
          App.translate(HABDetailScreenMessages.flightTime),
          App.translate(flight.time),
          Feather.clock,
        ),
        HABDetailScreenRowInfo(
          App.translate(HABDetailScreenMessages.price),
          App.translate(flight.price),
          Feather.tag,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.padding * 5,
            vertical: AppDimensions.padding * 4,
          ),
          child: Text(
            App.translate(flight.desc),
            style: TextStyle(
              fontSize: 12,
              color: theme.subText,
              height: 1.7,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          constraints: BoxConstraints(maxWidth: 500),
          margin: EdgeInsets.symmetric(
            vertical: AppDimensions.padding * 2,
            horizontal: AppDimensions.padding * 3,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                blurRadius: 15,
                spreadRadius: 0,
                offset: Offset(0, 15),
                color: theme.primary.withOpacity(0.35),
              )
            ],
          ),
          child: FlatButton(
            onPressed: () {},
            color: theme.primary,
            textColor: Colors.white,
            splashColor: Colors.transparent,
            highlightColor: Colors.black.withOpacity(0.1),
            padding: EdgeInsets.symmetric(vertical: AppDimensions.padding * 2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Text(
              App.translate(HABDetailScreenMessages.bookNow),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Container(
          height: UI.vertical * 5,
        )
      ],
    );
  }
}
