import 'package:apicat/views/cat/cat.dart';
import 'package:flutter/material.dart';

class CatScreen extends StatelessWidget {
  final String catsId;

  const CatScreen({Key? key, required this.catsId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("View the Cat")),
        body: Center(child: CatWidget(id: catsId)));
  }
}
