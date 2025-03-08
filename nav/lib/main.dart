import 'package:flutter/material.dart';
import 'V2.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}

///VISTA PRINCIPAL

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    // Navigation
    return Scaffold(
        appBar: AppBar(
          title: Text('Principal'),
        ),
        body: Center(
          child: Text("Michis"),
        ),
        bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search")
            ],
            onTap: (index) {
              if (index == 1) {
                // navigator
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => V2()));
              }
            }));
  }
}
