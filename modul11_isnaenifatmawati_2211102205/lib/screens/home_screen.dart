import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart'; // Import intl
import '../models/cart_model.dart';
import '../models/item.dart';
import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Item> availableItems = [
    Item(id: 1, name: "Semangka", price: 28000),
    Item(id: 2, name: "Melon", price: 35000),
    Item(id: 3, name: "Rambutan", price: 26000),
    Item(id: 4, name: "Kelengkeng", price: 50000),
    Item(id: 5, name: "Anggur", price: 75000),
    Item(id: 6, name: "Alpukat", price: 50000),
    Item(id: 7, name: "Pir", price: 45000),
  ];

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);

    return Scaffold(
      appBar: AppBar(
        title: const Text("snaa Fruitland 🥝🍒"),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: availableItems.length,
        itemBuilder: (context, index) {
          final item = availableItems[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text(formatCurrency.format(item.price)), // Format harga
            trailing: ElevatedButton(
              onPressed: () {
                Provider.of<CartModel>(context, listen: false).add(item);
              },
              child: const Text("Tambah"),
            ),
          );
        },
      ),
    );
  }
}
