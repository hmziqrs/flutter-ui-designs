class HFDFoodItem {
  HFDFoodItem({
    required this.id,
    required this.name,
    required this.author,
    required this.description,
    required this.testKey,
    required this.price,
    required this.stars,
    required this.location,
    required this.kcal,
    required this.dailyCal,
    required this.carbo,
    required this.protien,
    required this.fat,
    required this.image,
  });

  int id;
  String name;
  String author;
  String description;
  String testKey;
  double price;
  double stars;
  double location;
  double kcal;
  int dailyCal;
  int carbo;
  int protien;
  int fat;
  String image;
}
