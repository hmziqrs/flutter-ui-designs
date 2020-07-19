import 'dart:isolate';

const String scope = 'HFDDetailScreen';

const Map strings = {
  '$scope/title': 'Healthy Food',
  '$scope/orderNow': 'Order Now',
  '$scope/nutritionFact': 'Nutrition Fact',
  '$scope/dailyCalories': 'of daily calories',
  '$scope/carbo': 'Carbo',
  '$scope/protein': 'Protein',
  '$scope/fat': 'Fat',
};

main(List<String> args, SendPort port) {
  port.send({"strings": strings, "scope": scope});
}
