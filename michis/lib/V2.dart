/////VISTA 2
import 'package:flutter/material.dart';

import 'date.dart';

class V2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Michis 2')),
      body: Center(
        child: DatePickerExample(),
      ),
    );
  }
}
