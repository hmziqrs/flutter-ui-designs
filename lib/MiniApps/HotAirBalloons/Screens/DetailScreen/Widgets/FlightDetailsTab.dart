import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:flutter_uis/UI.dart';

import '../../../configs/theme.dart' as theme;
import '../../../data/flights.dart' as data;

import '../Dimensions.dart';
import 'RowInfo.dart';

class FlightDetailsTab extends StatelessWidget {
  FlightDetailsTab(this.flight);
  final data.HABFlight flight;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        RowInfo("Basket Size", flight.basketSize, Feather.users),
        RowInfo("Flight Time", flight.time, Feather.clock),
        RowInfo("Price", flight.price, Feather.tag),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.padding * 5,
            vertical: Dimensions.padding * 4,
          ),
          child: Text(
            flight.desc,
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
            vertical: Dimensions.padding * 2,
            horizontal: Dimensions.padding * 3,
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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            onPressed: () {},
            color: theme.primary,
            padding: EdgeInsets.symmetric(vertical: Dimensions.padding * 2),
            textColor: Colors.white,
            child: Text(
              "BOOK NOW",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            splashColor: Colors.transparent,
            highlightColor: Colors.black.withOpacity(0.1),
          ),
        ),
        Container(
          height: UI.vertical * 5,
        )
      ],
    );
  }
}
