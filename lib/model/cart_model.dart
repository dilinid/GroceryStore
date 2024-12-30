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
      for (var item in _shopItems) {
        debugPrint('Loaded Item: ${item.name}, Category: ${item.category}');
      }
      notifyListeners();
    } catch (e) {
      debugPrint('Error loading items: $e');
      _shopItems = [];
      notifyListeners();
    }
  }

  List<GroceryItem> get shopItems => _shopItems;
  List<GroceryItem> get cartItems => _cartItems;

  int getTotalItemCount() {
    int total = 0;
    for (var item in _cartItems) {
      total += item.quantity;
    }
    return total;
  }

  void addItemToCart(int index) {
    var item = _shopItems[index];
    var existingIndex =
        _cartItems.indexWhere((element) => element.name == item.name);

    if (existingIndex != -1) {
      _cartItems[existingIndex].quantity++;
    } else {
      _cartItems.add(GroceryItem(
        name: item.name,
        price: item.price,
        imagePath: item.imagePath,
        color: item.color,
        category: item.category,
        quantity: 1,
      ));
    }
    notifyListeners();
  }

  String calculateTotal() {
    double totalPrice = 0;
    for (var item in _cartItems) {
      totalPrice += item.price * item.quantity;
    }
    return totalPrice.toStringAsFixed(2);
  }

  void incrementQuantity(int index) {
    _cartItems[index].quantity++;
    notifyListeners();
  }

  void decrementQuantity(int index) {
    if (_cartItems[index].quantity > 1) {
      _cartItems[index].quantity--;
    } else {
      _cartItems.removeAt(index);
    }
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
