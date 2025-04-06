import 'package:flutter/material.dart';

import 'package:transparent_image/transparent_image.dart';
import 'V2.dart';

const String workCat =
    "https://www.catsluvus.com/wp-content/uploads/2023/04/Baby-Cats-Cute-and-Funny-Cat-Videos-Awesome.jpg";
const String cat1 = "./../../assets/images/cat1.jpg";

// view Home
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Cat's")),
      // body: Center(
      //   child: FadeInImage.memoryNetwork(
      //     placeholder: kTransparentImage,
      //     image:
      //         // "https://www.catsluvus.com/wp-content/uploads/2023/04/Baby-Cats-Cute-and-Funny-Cat-Videos-Awesome.jpg",
      //         'https://images.unsplash.com/photo-1533738363-b7f9aef128ce?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      //     width: 300,
      //   ),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Centra los elementos verticalmente
          crossAxisAlignment:
              CrossAxisAlignment.center, // Centra los elementos horizontalmente
          children: [
            FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image:
                  'https://images.unsplash.com/photo-1533738363-b7f9aef128ce?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              width: 300,
            ),
            const SizedBox(height: 20), // Espaciador entre la imagen y el texto
            const Text(
              '¡Mira qué lindo gatito! 🐱',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //     items: [
      //       BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.search), label: "Search"),
      //     ],
      //     onTap: (index) {
      //       if (index == 0) {
      //         Navigator.push(
      //             context, MaterialPageRoute(builder: (context) => V2()));
      //       }
      //     })
    );
  }
}
