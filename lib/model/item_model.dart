class GroceryItem {
  final String name;
  final double price; // Use double instead of String
  final String imagePath;
  final String color;
  final String category;
  int quantity;

  GroceryItem({
    required this.name,
    required this.price, // Adjust constructor
    required this.imagePath,
    required this.color,
    this.category = 'Uncategorized',
    this.quantity = 1,
  });

  factory GroceryItem.fromJson(Map<String, dynamic> json) {
    return GroceryItem(
      name: json['name'] ?? '',
      price: double.tryParse(json['price']?.toString() ?? '0.00') ?? 0.00,
      imagePath: json['image'] ?? '',
      color: json['color'] ?? 'grey',
      category: json['category']?.toString() ??
          'Uncategorized', // Properly parses category
    );
  }
}
