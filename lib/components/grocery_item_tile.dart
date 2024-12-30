import 'package:flutter/material.dart';

class GroceryItemTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final Color color;
  final VoidCallback onPressed;

  const GroceryItemTile({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.imagePath,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color.withOpacity(0.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(imagePath, height: 64, fit: BoxFit.cover),
          Text(itemName, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text('Rs. $itemPrice'),
          ElevatedButton(
            onPressed: onPressed,
            child: const Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
