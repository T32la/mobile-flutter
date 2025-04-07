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
          Expanded(
            child: CatListScreen(),
          ),
        ],
      ),
    );
  }
}
