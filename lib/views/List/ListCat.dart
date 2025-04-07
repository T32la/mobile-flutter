import 'package:apicat/views/cat/catview.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Crear el estado
class CatListScreen extends StatefulWidget {
  const CatListScreen({super.key});

  @override
  _CatListScreenState createState() => _CatListScreenState();
}

class _CatListScreenState extends State<CatListScreen> {
  List<dynamic> listcats = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCat();
  }

  Future<void> fetchCat() async {
    final url = Uri.parse("https://cataas.com/api/cats?skip=0&limit=10");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        listcats = data;
        isLoading = false;
      });
    } else {
      setState(() {
        //TODO Important update the status even the exist error.
        isLoading = false;
      });
      throw Exception("Error al cargar datos: ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("List cats")),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              // construction list the elements dynamic for Data API
              itemCount: listcats.length,
              itemBuilder: (context, index) {
                final cat = listcats[index];
                final imageUrl = "https://cataas.com/cat/${cat["id"]}";
                return ListTile(
                  leading: Image.network(
                    imageUrl, // Construir la URL correcta con el ID
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.image_not_supported),
                  ),
                  title: Text(cat["tags"]?.join(", ") ?? "Sin etiquetas"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CatScreen(catsId: cat["id"])));
                  },
                );
              }),
    );
  }
}
