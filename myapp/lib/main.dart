import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext) {
    return MaterialApp(
      // codigo para todo el interface
      home: Scaffold(
        appBar: AppBar(
          title: Text('Victor'),
          backgroundColor: Colors.red,
        ),
        body: Center(
          // child: Text('Hola Mundo, en flutter!!!'),
          child: ContadorScreen(),
        ),
      ),
    );
  }
}

// Estado
class ContadorScreen extends StatefulWidget {
  @override
  _ContadorScreenState createState() => _ContadorScreenState();
}

// Grafico
class _ContadorScreenState extends State<ContadorScreen> {
  int i = 0;

  void incrementar() {
    setState(() {
      i++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text(
            '$i',
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: incrementar,
          child: Icon(Icons.add),
          backgroundColor: Colors.blue,
        ));
  }
}
