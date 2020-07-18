import 'dart:isolate';

const String scope = 'SKVRoot';

const Map strings = {
  // Objects
  '$scope/explore': "Explore",
  '$scope/objectMercuryNick': "The Swiftest Planet",
  '$scope/objectMercuryPosition': "Fourth planet From the sun",
  '$scope/objectVenusNick': "Palnetary Hot Spot",
  '$scope/objectVenusPosition': "Second planet from the sun",
  '$scope/objectEarthNick': "Our Home Planet",
  '$scope/objectEarthPosition': "Second planet from the sun",
  '$scope/objectMarsNick': "Red Planet",
  '$scope/objectMarsPosition': "Fourth planet From the sun",
  '$scope/objectJupiterNick': "Massive planet",
  '$scope/objectJupiterPosition': "Fourth planet From the sun",

  // Stories
  '$scope/story1Title': "Andromeda",
  '$scope/story1Desc':
      "The Andromeda Galaxy also known as Messier 31, M31, or NGC 224 and originally the Andromeda Nebula",

  '$scope/story2Title': "Hubble Space Telescope",
  '$scope/story2Desc':
      "Breathtaking photos and science-changing discoveries from 25 years of exploration.",

  '$scope/story3Title': "International Space Station",
  '$scope/story3Desc':
      "The International Space Station (ISS) is a space station (habitable artificial satellite) in low Earth orbit.",
};

main(List<String> args, SendPort port) {
  port.send({"strings": strings, "scope": scope});
}
