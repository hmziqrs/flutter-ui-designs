import '../models/HABFlight.dart';
export '../models/HABFlight.dart';

import '../messages/keys.dart';

final flights = [
  new HABFlight(
    id: 1,
    name: HABRootMessages.standardTitle,
    people: HABRootMessages.standardPeoples,
    basketSize: HABRootMessages.standardBasketSize,
    shortDesc: HABRootMessages.standardShortDesc,
    time: HABRootMessages.standardTime,
    price: HABRootMessages.standardPrice,
    desc: HABRootMessages.standardDesc,
  ),
  new HABFlight(
    id: 2,
    name: HABRootMessages.ultraComfortTitle,
    people: HABRootMessages.ultraComfortPeoples,
    basketSize: HABRootMessages.ultraComfortBasketSize,
    shortDesc: HABRootMessages.ultraComfortShortDesc,
    time: HABRootMessages.ultraComfortTime,
    price: HABRootMessages.ultraComfortPrice,
    desc: HABRootMessages.ultraComfortDesc,
  ),
  new HABFlight(
    id: 3,
    name: HABRootMessages.exclusiveTitle,
    people: HABRootMessages.exclusivePeoples,
    basketSize: HABRootMessages.exclusiveBasketSize,
    breakFastType: HABRootMessages.exclusiveBreakFastType,
    breakFast: HABRootMessages.exclusiveBreakFast,
    shortDesc: HABRootMessages.exclusiveShortDesc,
    time: HABRootMessages.exclusiveTime,
    price: HABRootMessages.exclusivePrice,
    desc: HABRootMessages.exclusiveDesc,
  ),
];
