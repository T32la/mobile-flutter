import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// State
class CatWidget extends StatefulWidget {
  final int id;

  CatWidget({Key? key, required this.id}) : super(key: key);
  @override
  _CatWidgetState createState() => _CatWidgetState();
}

// Class with design of WidgetCat
class _CatWidgetState extends State<CatWidget> {
  // Create variable save data cat
  Map<String, dynamic>? cats;

  // Create variable boolean of detected the looding
  bool isLoading = true;

  // Start the init State
  // Call the function data cat fetch api with use API, base id
  @override
  void initState() {
    super.initState();
    obtenerCat();
  }

  // Function call the API, fetching data cat.
  Future<void> obtenerCat() async {
    final url = Uri.parse(' https://cataas.com/cat/${widget.id}');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        cats = data;
        isLoading = false;
      });
    } else {
      throw Exception("Error al cargar datos");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isLoading
          ? CircularProgressIndicator()
          : cats == null
              ? Text('Error the charger the cat')
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(cats!["mimetype"]),
                    SizedBox(height: 10),
                    Text(cats!["tags"])
                  ],
                ),
    );
  }
}
