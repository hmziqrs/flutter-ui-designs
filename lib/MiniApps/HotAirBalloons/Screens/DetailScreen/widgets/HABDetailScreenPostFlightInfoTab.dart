import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';

import 'package:flutter_uis/configs/App.dart';

import '../../../data/flights.dart' as data;
import '../messages/keys.dart';

import 'HABDetailScreenRowInfo.dart';

class HABDetailScreenPostFlightInfoTab extends StatelessWidget {
  const HABDetailScreenPostFlightInfoTab(this.flight);
  final data.HABFlight flight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HABDetailScreenRowInfo(
          App.translate(
            HABDetailScreenMessages.celebration,
            context,
          ),
          App.translate(
            flight.celebration,
            context,
          ),
          Entypo.drink,
          fullWidth: true,
        ),
        HABDetailScreenRowInfo(
          App.translate(
            HABDetailScreenMessages.flightCertificate,
            context,
          ),
          App.translate(
            flight.certificate,
            context,
          ),
          MaterialCommunityIcons.certificate,
          fullWidth: true,
        ),
        HABDetailScreenRowInfo(
          App.translate(
            HABDetailScreenMessages.serviceBack,
            context,
          ),
          App.translate(
            flight.serviceBack,
            context,
          ),
          MaterialCommunityIcons.bus_side,
          fullWidth: true,
        ),
      ],
    );
  }
}
