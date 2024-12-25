import 'package:flutter/material.dart';
import '../services/item_service.dart';
import 'item_model.dart';

class CartModel extends ChangeNotifier {
  List<GroceryItem> _shopItems = [];
  final List<GroceryItem> _cartItems = [];
  final ItemService _itemService = ItemService();

  CartModel() {
    _loadItems();
  }

  Future<void> _loadItems() async {
    try {
      _shopItems = await _itemService.loadItems();
      notifyListeners();
    } catch (e) {
      print('Error loading items: $e');
      _shopItems = [];
      notifyListeners();
    }
  }

  List<GroceryItem> get shopItems => _shopItems;
  List<GroceryItem> get cartItems => _cartItems;

  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  String calculateTotal() {
    double totalPrice = 0;
    for (var item in _cartItems) {
      totalPrice += double.parse(item.price);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
