import 'package:flutter/material.dart';
import './home.dart';

void main() {
  runApp(const DaangnApp());
}

class DaangnApp extends StatelessWidget {
  const DaangnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
