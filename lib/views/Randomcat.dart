/////VISTA 3
import 'package:flutter/material.dart';
import 'package:apicat/views/List/ListCat.dart';

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
