import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier{
  //list of items on sale
  final List _shopItems = [
    ['Banana', '110.00', 'assets/images/banana.png', Colors.yellow],
    ['Avocado', '60.00', 'assets/images/avocado.png', Colors.green],
    ['Apple', '50.00', 'assets/images/apple.png', Colors.red],
    ['Pineapple', '150.00', 'assets/images/pineapple.png', Colors.yellow],
    ['Guava', '140.00', 'assets/images/guava.png', Colors.lightGreen],
    ['Carrot', '50.00', 'assets/images/carrot.png', Colors.orange],
    ['Cabbage', '90.00', 'assets/images/cabbage.png', Colors.green],
    ['Eggplant', '60.00', 'assets/images/eggplant.png', Colors.purple],
    ['Green Beans', '110.00', 'assets/images/greenbeans.png', Colors.green],
    ['Chicken', '960.00', 'assets/images/chicken.png', Colors.red],
    ['Bread', '140.00', 'assets/images/bread.png', Colors.brown],
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