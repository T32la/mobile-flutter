import 'package:flutter/material.dart';

// Crear el estado
class CatListScreen extends StatefulWidget {
  const CatListScreen({super.key});

  @override
  _CatListScreenState createState() => _CatListScreenState();
}

class _CatListScreenState extends State<CatListScreen> {
  List<dynamic> cats = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text("List Cats "));
  }
}
