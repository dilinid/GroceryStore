import 'dart:convert';
import 'package:flutter/services.dart';
import '../model/item_model.dart';

class ItemService {
  Future<List<GroceryItem>> loadItems() async {
    try {
      // Load JSON from the assets directory
      final String response = await rootBundle.loadString('assets/data/shop_items.json');
      final data = json.decode(response) as Map<String, dynamic>;
      
      // Parse the JSON into a list of GroceryItems
      return (data['items'] as List)
          .map((item) => GroceryItem.fromJson(item))
          .toList();
    } catch (e) {
      throw Exception('Failed to load items: $e');
    }
  }
}
