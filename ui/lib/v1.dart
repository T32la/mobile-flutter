import 'package:flutter/material.dart';
import 'package:ui/appbar.dart';
import 'package:ui/content.dart';
import 'package:ui/trendingbar.dart';

class HomeVista extends StatefulWidget {
  const HomeVista({super.key});

  @override
  _HomeVistaState createState() => _HomeVistaState();
}

// _HomeVistaState
class _HomeVistaState extends State<HomeVista> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(),
      body: Container(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TrendingCategories(),
            Expanded(child: NewsList(),)
            ],
        ),
      ),
    );
  }
}
