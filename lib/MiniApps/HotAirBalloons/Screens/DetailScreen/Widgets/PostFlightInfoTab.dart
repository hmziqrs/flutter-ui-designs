import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../../data/flights.dart' as data;
import 'RowInfo.dart';

class PostFlightInfoTab extends StatelessWidget {
  const PostFlightInfoTab(this.flight);
  final data.HABFlight flight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RowInfo(
          "Celebration",
          flight.celebration,
          Entypo.drink,
          fullWidth: true,
        ),
        RowInfo(
          "Flight Certificate",
          flight.certificate,
          MaterialCommunityIcons.certificate,
          fullWidth: true,
        ),
        RowInfo(
          "Service back to your hotel",
          flight.serviceBack,
          MaterialCommunityIcons.bus_side,
          fullWidth: true,
        ),
      ],
    );
  }
}
