/////VISTA 3
import 'package:apicat/views/List/ListCat.dart';
import 'package:flutter/material.dart';

class RandomCat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Michis 2')),
      body: Center(
        child: CatListScreen(),
      ),
    );
  }
}
