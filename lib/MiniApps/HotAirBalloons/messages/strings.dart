import 'dart:isolate';

const String scope = 'HABRoot';

const Map strings = {
  // standard
  '$scope/standardTitle': "Standard",
  '$scope/standardPeoples': "20-24 people",
  '$scope/standardBasketSize': "20 or 24 people baskets with 4 compartments",
  '$scope/standardShortDesc': "One hour in a 20 people basket",
  '$scope/standardTime': "Minimum 1 hour in our standard flight",
  '$scope/standardPrice': "Our Standard flight is 190€ per person",
  '$scope/standardDesc':
      "The flight is minimum one hour and we will ascend anywhere from rock formations to several thousand feet. Once you’re airborne your pilot will point out the spectacular sites of Cappadocia, from Red Valley to the Goreme and vineyards to rock formations, absolutely beauty of the nature. Our flying area has many wonderful things to see.",

  // Ultra Comfort
  '$scope/ultraComfortTitle': "Ultra Comfort",
  '$scope/ultraComfortPeoples': "8-16 people",
  '$scope/ultraComfortBasketSize': "8 or 16 people baskets with 4 compartments",
  '$scope/ultraComfortShortDesc': "75 to 90 minutes in 16 people basket",
  '$scope/ultraComfortTime':
      "Min. 75 minutes to 90 minutes flight in our ultra comfort flight",
  '$scope/ultraComfortPrice': "Our Ultra Comfort flight is 230€ per person",
  '$scope/ultraComfortDesc':
      "The flight is minimum 75 to 90 minutes hour and we will ascend anywhere from rock formations to several thousand feet. Once you’re airborne your pilot will point out the spectacular sites of Cappadocia, from Red Valley to the Goreme and vineyards to rock formations, absolutely beauty of the nature. Our flying area has many wonderful things to see.",

  // Exclusive
  '$scope/exclusiveTitle': "Exclusive",
  '$scope/exclusivePeoples': "4 people",
  '$scope/exclusiveBasketSize': "4 people baskets with 1 compartment",

  '$scope/exclusiveBreakFastType': "In-flight breakfast",
  '$scope/exclusiveBreakFast':
      "The breakfast of Vista basket is in-flight service and before the flight we offer you a hot drinks and during the flight you can enjoy your breakfast. We promise you that it will be an unforgettable breakfast in the open sky.",
  '$scope/exclusiveShortDesc': "One hour and a half in a 4 people basket",
  '$scope/exclusiveTime': "Minimum 1 and a half hour in our Exclusive flight",
  '$scope/exclusivePrice':
      "Our Exclusive Flights is 3600€ for the basket, per flight.",
  '$scope/exclusiveDesc':
      '''We fly through the Cappadocian Valleys for one and a half hours in a private balloon up to four passengers. Our personal touch and professional experience will definitely make your flight “a memorable event” for long years to come.
\n
Our Vista basket is the only example in the world for hot air balloon flights. Its a seated basket which you can enjoy the scenery while you are having your champagne. The seated basket price is 2000€ and it is not per person. Max. capacity of the basket is 4 persons and it can be one person or 4 persons.
\n
Your exclusive balloon ride will be created to your desires and wishes from the time we collect you from your location.''',

  // Default Strings
  '$scope/defaultBreakFast':
      "While our pilots are choosing the take-off site, you will have an open buffet – fully catered breakfast in our restaurant. We have a proper indoor place to enjoy early breakfast. Simply, you are free of winds, dust and cold. Cups of coffee or teas will go well with traditional pastry as well as cheese, olives, cake, sausages etc.",
  '$scope/defaultBreakFastType': "Open buffet breakfast",
  '$scope/defaultPickUp':
      "We make your transfer with luxury mini buses from your hotel to our restaurant one hour prior to sunrise. We will inform you the day before about the pick-up time in the morning from your hotel.",
  '$scope/defaultInflation':
      "After the decision of the launch site by our pilots, we transfer the passengers. To offer the best possible flight and the experience, we choose the take-off site for the day’s flight according to the direction and the strength of the wind. One of life’s most fascinating sights is the set-up and inflation of a hot air balloon.",
  '$scope/defaultInFlighInfo':
      '''Once the balloon is stabilised, the passengers receive their call and the adventure begins. Before  take-off , your pilot will brief you about safety procedures. Please listen carefully and follow all of your pilot’s instructions.
\n
The sensation of ballooning is very gentle and its calming effect seems to put the world below into perspective. Rock formations and world-famous fairy chimneys drift into view, giving you an unmatched feeling of being above it all.
\n
Your pilot can turn the balloon using the rotation vents and provide you with a full panoramic view as you glide through the skies.''',
  '$scope/defaultCelebration':
      'After the flight, when your feet find their way back to earth, the crew will meet you, and help you celebrate your voyage with the traditional champagne toast and memories to last a lifetime.',
  '$scope/defaultCertificate':
      "We give you a commemorative flight certificate written by a calligraph, suitable for framing, and memories to last a lifetime.",
  '$scope/defaultServiceBack':
      "We will transfer you back to your hotel in the day of your flight. Also if requested we can take yo to the location you want in Cappadocia.",
};

main(List<String> args, SendPort port) {
  port.send({"strings": strings, "scope": scope});
}
