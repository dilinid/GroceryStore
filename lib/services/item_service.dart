import 'dart:convert';
import 'package:flutter/services.dart';
import '../model/item_model.dart';

class ItemService {
  Future<List<GroceryItem>> loadItems() async {
    final String response = await rootBundle.loadString('assets/data/shop_items.json');
    final data = await json.decode(response);
    
    List<GroceryItem> items = [];
    for (var item in data['items']) {
      items.add(GroceryItem.fromJson(item));
    }
    return items;
  }
}