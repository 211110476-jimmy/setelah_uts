import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart {
  final int id;
  final String name;
  final String description;
  final String price;
  final String imagePath;
  int quantity;

  Cart({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
    this.quantity = 1,
  });
}
class CartProvider extends ChangeNotifier {
  List<Cart> cartItems = [];

  void addToCart(Cart item) {
    cartItems.add(item);
    notifyListeners();
  }

  void removeFromCart(Cart item) {
    cartItems.remove(item);
    notifyListeners();
  }
}