import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Keep in Touch',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
  print("Bu mesaj feature/guncelleme branch'inden geldi!");

}
