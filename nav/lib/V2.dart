/////VISTA 2
import 'package:flutter/material.dart';
import 'date.dart';

class V2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('fecha')),
      body: Center(
        child: DatePickerExample(),
      ),
    );
  }
}
