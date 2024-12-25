class GroceryItem {
  final String name;
  final String price;
  final String imagePath;
  final String color;

  GroceryItem({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.color,
  });

  factory GroceryItem.fromJson(Map<String, dynamic> json) {
    return GroceryItem(
      name: json['name'] ?? '',
      price: json['price'] ?? '0.00',
      imagePath: json['image'] ?? '',
      color: json['color'] ?? 'grey',
    );
  }
}
