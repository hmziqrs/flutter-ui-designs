import '../models/SKVObject.dart';
export '../models/SKVObject.dart';

import '../messages/keys.dart';
import 'TestKeys.dart';

final List<SKVObject> objectList = [
  new SKVObject(
    "MERCURY",
    SKVRootMessages.objectMercuryNick,
    SKVRootMessages.objectMercuryPosition,
    "assets/ma-skv/mercury.png",
    testKey: SKVRootTestKeys.mercury,
    distanceInKm: "54.600.00 km away",
    distanceFromSun: "36,116,057",
    lightTimeFromSun: "3.231326",
    lengthOfYears: "88",
  ),
  new SKVObject(
    "VENUS",
    SKVRootMessages.objectVenusNick,
    SKVRootMessages.objectVenusPosition,
    "assets/ma-skv/venus.png",
    testKey: SKVRootTestKeys.venus,
    distanceInKm: "54.600.00 km away",
    distanceFromSun: "246,970,045",
    lightTimeFromSun: "13.730062",
    lengthOfYears: "687",
  ),
  new SKVObject(
    "EARTH",
    SKVRootMessages.objectEarthNick,
    SKVRootMessages.objectEarthPosition,
    "assets/ma-skv/earth.png",
    testKey: SKVRootTestKeys.earth,
    distanceInKm: "54.600.00 km away",
    distanceFromSun: "246,970,045",
    lightTimeFromSun: "13.730062",
    lengthOfYears: "687",
  ),
  new SKVObject(
    "MARS",
    SKVRootMessages.objectMarsNick,
    SKVRootMessages.objectMarsPosition,
    "assets/ma-skv/mars.png",
    testKey: SKVRootTestKeys.mars,
    distanceInKm: "54.600.00 km away",
    distanceFromSun: "246,970,045",
    lightTimeFromSun: "13.730062",
    lengthOfYears: "687",
  ),
  new SKVObject(
    "JUPITER",
    SKVRootMessages.objectJupiterNick,
    SKVRootMessages.objectJupiterPosition,
    "assets/ma-skv/jupiter.png",
    testKey: SKVRootTestKeys.jupiter,
    distanceInKm: "54.600.00 km away",
    distanceFromSun: "246,970,045",
    lightTimeFromSun: "13.730062",
    lengthOfYears: "687",
  ),
];
