import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../../data/flights.dart' as data;
import 'HABDetailScreenRowInfo.dart';

class HABDetailScreenPostFlightInfoTab extends StatelessWidget {
  const HABDetailScreenPostFlightInfoTab(this.flight);
  final data.HABFlight flight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HABDetailScreenRowInfo(
          "Celebration",
          flight.celebration,
          Entypo.drink,
          fullWidth: true,
        ),
        HABDetailScreenRowInfo(
          "Flight Certificate",
          flight.certificate,
          MaterialCommunityIcons.certificate,
          fullWidth: true,
        ),
        HABDetailScreenRowInfo(
          "Service back to your hotel",
          flight.serviceBack,
          MaterialCommunityIcons.bus_side,
          fullWidth: true,
        ),
      ],
    );
  }
}
