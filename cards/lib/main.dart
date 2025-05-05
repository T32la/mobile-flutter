import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Card Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({this.title = 'Demo'});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black45,
          title: Text(widget.title),
        ),
        body: Container(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    buildCard(),
                    buildCard(),
                    buildCard(),
                    buildCard(),
                    buildCard(),
                    buildCard(),
                    buildCard(),
                  ],
                ))));
  }

  Card buildCard() {
    var ran = Random();
    var heading = '\$${(ran.nextInt(20) + 15).toString()}00 per month';
    var subheading =
        '${(ran.nextInt(3) + 1).toString()} bed, ${(ran.nextInt(2) + 1).toString()} bath, ${(ran.nextInt(10) + 7).toString()}00 sqft';
    var cardImage = NetworkImage(
        'https://plus.unsplash.com/premium_photo-1689609950112-d66095626efb?q=80&w=987&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D' +
            ran.nextInt(100).toString());
    // var supportingText =
    //     'Beautiful home to rent, recently refurbished with modern appliances...';

    return Card(
        elevation: 9.0,
        child: Column(
          children: [
            ListTile(
              title: Text(heading),
              subtitle: Text(subheading),
              // trailing: Icon(Icons.favorite_outline),
            ),
            Container(
              height: 200.0,
              child: Ink.image(
                image: cardImage,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.centerLeft,
              // child: Text(supportingText),
            ),
            // ButtonBar(
            //   children: [
            //     TextButton(
            //       child: const Text('CONTACT AGENT'),
            //       onPressed: () {/* ... */},
            //     ),
            //     TextButton(
            //       child: const Text('LEARN MORE'),
            //       onPressed: () {/* ... */},
            //     )
            //   ],
            // )
          ],
        ));
  }
}
