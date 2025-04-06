import 'package:apicat/views/Home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyCat());
}

class MyCat extends StatelessWidget {
  const MyCat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}
