import 'package:api/personaje/personajevista.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Crear un estado
class CharacterListScreen extends StatefulWidget {
  const CharacterListScreen({super.key});
  @override
  _CharacterListScreenState createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
  // almacer los personajes
  List<dynamic> characters = [];
  // Estado que detecte la carga de la informacion de la base de datos.
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchPersonaje();
  }

  Future<void> fetchPersonaje() async {
    final url =
        Uri.parse("https://dragonball-api.com/api/characters?page=1&limit=15");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        characters = data['items'];
        isLoading = false;
      });
    } else {
      throw Exception("Error al cargar datos");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dragon Ball Characters")),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              //Construye una lista de elementos de manera dinámica según los datos de la API.
              itemCount: characters.length,
              itemBuilder: (context, index) {
                final character = characters[index];
                return ListTile(
                  leading: character['image'] != null
                      ? Image.network(character['image'],
                          width: 50, height: 50, fit: BoxFit.cover)
                      : Icon(Icons.person),
                  title: Text(character['name'] ?? "Desconocido"),
                  subtitle: Text(
                    "Ki: ${character['ki']} / Max Ki: ${character['maxKi']}\nRaza: ${character['race']}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Text(character['affiliation'] ?? "Sin afiliación"),
                  onTap: () {
                    //Accion que se realiza cuando se da click en cualquier elemento de la lista

                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(
                    //       content:
                    //           Text("Seleccionaste a ${character['name']}")),
                    // );

                    // Navegacion para otra vista
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PersonajeScreen(
                                  personajeId: character["id"],
                                )));
                  },
                );
              },
            ),
    );
  }
}
