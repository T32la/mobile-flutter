// HomeCat
import 'package:apicat/views/List/ListCat.dart';
import 'package:flutter/material.dart';

class HomeCat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cat's Home")),
      body: Column(
        children: [
          Image.network("https://cataas.com/cat", // Imagen aleatoria
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover),
          Expanded(child: CatListScreen()),
        ],
      ),
    );
  }
}
