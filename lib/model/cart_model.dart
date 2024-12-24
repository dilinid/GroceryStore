import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier{
  //list of items on sale
  final List _shopItems = [
    ['Avocado', '60.00', 'assets/images/avocado.png', Colors.green],
    ['Apple', '50.00', 'assets/images/apple.png', Colors.red],
    ['Banana', '110.00', 'assets/images/banana.png', Colors.yellow],
    ['Bread', '150.00', 'assets/images/bread.png', Colors.brown],
    ['Guava', '140.00', 'assets/images/guava.png', Colors.green],
    ['Water', '90.00', 'assets/images/water.png', Colors.blue],
  ];

  //list of cart items
  final List _cartItems = [];

  get shopItems => _shopItems;

  get cartItems => _cartItems;

  //add items to cart
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  //remove items from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  //calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i=0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }

}