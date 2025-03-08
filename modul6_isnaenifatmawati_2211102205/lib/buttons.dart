import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ButtonExample(),
    );
  }
}

class ButtonExample extends StatefulWidget {
  const ButtonExample({super.key});

  @override
  State<ButtonExample> createState() => _ButtonExampleState();
}

class _ButtonExampleState extends State<ButtonExample> {
  // Mengubah nilai default agar cocok dengan daftar DropdownMenuItem
  String selectedValue = 'Option 1'; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Buttons & Dropdown')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                print('Ini Done');
              },
              child: const Text('Submit'),
            ),
            const SizedBox(height: 20),

            TextButton(
              onPressed: () {
                print('Sukses');
              },
              child: const Text('Menu'),
            ),
            const SizedBox(height: 20),

            // Dropdown yang sudah diperbaiki
            DropdownButton<String>(
              value: selectedValue, // Sekarang cocok dengan daftar item
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue!;
                });
              },
              items: <String>[
                'Option 1',
                'Option 2',
                'Option 3',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
