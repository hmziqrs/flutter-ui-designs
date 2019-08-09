class Flight {
  Flight({
    this.id,
    this.name,
    this.people,
    this.basketSize,
    this.shortDesc,
    this.breakFast =
        "While our pilots are choosing the take-off site, you will have an open buffet – fully catered breakfast in our restaurant. We have a proper indoor place to enjoy early breakfast. Simply, you are free of winds, dust and cold. Cups of coffee or teas will go well with traditional pastry as well as cheese, olives, cake, sausages etc.",
    this.breakFastType = "Open buffet breakfast",
    this.time,
    this.price,
    this.desc,
  });

  final int id;
  final String name;
  final String people;
  final String basketSize;
  final String shortDesc;
  final String time;
  final String price;
  final String desc;

  // Pre Flight
  final String pickUp =
      "We make your transfer with luxury mini buses from your hotel to our restaurant one hour prior to sunrise. We will inform you the day before about the pick-up time in the morning from your hotel.";
  final String breakFastType;
  final String breakFast;
  final String inflation =
      "After the decision of the launch site by our pilots, we transfer the passengers. To offer the best possible flight and the experience, we choose the take-off site for the day’s flight according to the direction and the strength of the wind. One of life’s most fascinating sights is the set-up and inflation of a hot air balloon.";

  final String inFlightInfo =
      '''Once the balloon is stabilised, the passengers receive their call and the adventure begins. Before  take-off , your pilot will brief you about safety procedures. Please listen carefully and follow all of your pilot’s instructions.
\n
The sensation of ballooning is very gentle and its calming effect seems to put the world below into perspective. Rock formations and world-famous fairy chimneys drift into view, giving you an unmatched feeling of being above it all.
\n
Your pilot can turn the balloon using the rotation vents and provide you with a full panoramic view as you glide through the skies.''';

  // Post Flight
  final String celebration =
      'After the flight, when your feet find their way back to earth, the crew will meet you, and help you celebrate your voyage with the traditional champagne toast and memories to last a lifetime.';
  final String certificate =
      "We give you a commemorative flight certificate written by a calligraph, suitable for framing, and memories to last a lifetime.";
  final String serviceBack =
      "We will transfer you back to your hotel in the day of your flight. Also if requested we can take yo to the location you want in Cappadocia.";
}
