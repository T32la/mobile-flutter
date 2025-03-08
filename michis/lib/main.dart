import 'package:flutter/material.dart';
import 'V2.dart';
import 'Lista.dart';

void main() {
  runApp(const MyCat());
}

// MyCat
class MyCat extends StatelessWidget {
  const MyCat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}

// Vistas
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("los gatos"),
      ),
      body: Center(
        child: ListTileExample(),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search")
          ],
          onTap: (index) {
            if (index == 1) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => V2()));
            }
          }),
    );
  }
}
