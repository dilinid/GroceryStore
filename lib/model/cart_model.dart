import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier{
  //list of items on sale
  final List _shopItems = [
    ['Avacado', '60.00', 'assets/images/avacado.jpeg', Colors.green],
    ['Apple', '50.00', 'assets/images/apple.jpeg', Colors.red],
    ['Banana', '110.00', 'assets/images/avacado.jpeg', Colors.yellow],
    ['Bread', '150.00', 'assets/images/avacado.jpeg', Colors.brown],
    ['Water', '90.00', 'assets/images/avacado.jpeg', Colors.blue],
  ];

  //list of cart items
  List _cartItems = [];

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