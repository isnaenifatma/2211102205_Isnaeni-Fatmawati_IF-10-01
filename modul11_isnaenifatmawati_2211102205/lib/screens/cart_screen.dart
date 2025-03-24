import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart'; // Import intl
import '../models/cart_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);
    final formatCurrency = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);

    return Scaffold(
      appBar: AppBar(title: const Text("Keranjang Belanja")),
      body: cart.items.isEmpty
          ? const Center(child: Text("Keranjang kosong"))
          : ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final item = cart.items[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              formatCurrency.format(item.price), // Format harga
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove_circle_outline),
                              onPressed: () {
                                cart.decreaseQuantity(item);
                              },
                            ),
                            Text(
                              "${item.quantity}",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add_circle_outline),
                              onPressed: () {
                                cart.add(item);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: Text(
          "Total: ${formatCurrency.format(cart.totalPrice)}", // Format total harga
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
