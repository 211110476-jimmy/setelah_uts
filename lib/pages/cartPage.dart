import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart.dart';

class ShoppingCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        backgroundColor: Colors.orange,
      ),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, _) {
          if (cartProvider.cartItems.length == 0) {
            return Center(
              child: Text("Nothing in the cart :(",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
            );
          } else {
            return ListView.builder(
              itemCount: cartProvider.cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = cartProvider.cartItems[index];
                return ListTile(
                  leading: Image.asset(cartItem.imagePath),
                  title: Text(
                    cartItem.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  subtitle: Text(
                    'Rp${cartItem.price}',
                    style: const TextStyle(
                      color: Colors.redAccent,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (cartItem.quantity > 1) {
                            cartItem.quantity--;
                            cartProvider.notifyListeners();
                          }
                        },
                        icon: const Icon(Icons.remove),
                      ),
                      Text('${cartItem.quantity}'),
                      IconButton(
                        onPressed: () {
                          cartItem.quantity++;
                          cartProvider.notifyListeners();
                        },
                        icon: const Icon(Icons.add),
                      ),
                      IconButton(
                        onPressed: () {
                          cartProvider.removeFromCart(cartItem);
                        },
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          onPressed: () {
            // Handle checkout logic here
          },
          child: const Text('Checkout'),
          style: ElevatedButton.styleFrom(
            primary: Colors.orange,
            padding: const EdgeInsets.all(20.0),
          ),
        ),
      ),
    );
  }
}
