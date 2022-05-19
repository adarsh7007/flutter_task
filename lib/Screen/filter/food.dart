class Food {
  final String name;
  final double price;
  final String foodType;

  Food({
    required this.name,
    required this.price,
    required this.foodType,
  });
}

final phoneList = [
  Food(
    name: 'pasta',
    price: 100.0,
    foodType: 'fastfood',
  ),
  Food(
    name: 'pizza',
    price: 600.0,
    foodType: 'fastfood',
  ),
  Food(
    name: 'paneer',
    price: 200.0,
    foodType: 'normal',
  ),
  Food(
    name: ' shahi paneer',
    price: 650.0,
    foodType: 'normal',
  ),
];
