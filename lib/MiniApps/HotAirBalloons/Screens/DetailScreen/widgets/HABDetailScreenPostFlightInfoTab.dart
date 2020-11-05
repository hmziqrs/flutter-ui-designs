import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:flutter_uis/configs/App.dart';

import '../../../data/flights.dart' as data;
import 'HABDetailScreenRowInfo.dart';
import '../messages/keys.dart';

class HABDetailScreenPostFlightInfoTab extends StatelessWidget {
  const HABDetailScreenPostFlightInfoTab(this.flight);
  final data.HABFlight flight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HABDetailScreenRowInfo(
          App.translate(HABDetailScreenMessages.celebration),
          App.translate(flight.celebration),
          Entypo.drink,
          fullWidth: true,
        ),
        HABDetailScreenRowInfo(
          App.translate(HABDetailScreenMessages.flightCertificate),
          App.translate(flight.certificate),
          MaterialCommunityIcons.certificate,
          fullWidth: true,
        ),
        HABDetailScreenRowInfo(
          App.translate(HABDetailScreenMessages.serviceBack),
          App.translate(flight.serviceBack),
          MaterialCommunityIcons.bus_side,
          fullWidth: true,
        ),
      ],
    );
  }
}
