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
      home: Scaffold(
        appBar: AppBar(title: const Text("Column Example")),
        body: const Center(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Pusatkan elemen secara vertikal
            children: <Widget>[
              Text('Deliver features faster', style: TextStyle(fontSize: 18)),
              Text('Craft beautiful UIs', style: TextStyle(fontSize: 18)),
              SizedBox(height: 20), // Beri jarak sebelum logo
              Expanded(
                child: FittedBox(
                  fit: BoxFit.contain, // Mencegah logo terlalu kecil
                  child: FlutterLogo(
                    size: 100,
                  ), // Tambahkan ukuran untuk proporsi
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}