import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Estado
class PersonajeWidget extends StatefulWidget {
  final int id;

  PersonajeWidget({Key? key, required this.id}) : super(key: key);

  @override
  _PersonajeWidgetState createState() => _PersonajeWidgetState();
}

// Clase con el diseño del widget_PersonajeWidgetState

class _PersonajeWidgetState extends State<PersonajeWidget> {
  // crear una variable donde almacenar la info del PersonajeWidget
  Map<String, dynamic>? personaje;

  // crear variable booleano para detectar la carga
  bool isLoading = true;

  // poner el init state y que me llame a una funcion que se encargue de llamar a la info del personaje de uan api en base a un id
  @override
  void initState() {
    super.initState();
    obtenerPersonaje();
  }

  // tener la funcion que llame a la api para obtener la info de ese personaje
  Future<void> obtenerPersonaje() async {
    final url =
        Uri.parse('https://dragonball-api.com/api/characters/${widget.id}');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        personaje = data;
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
            : personaje == null
                ? Text('Error al cargar el personaje')
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(personaje!['image']),
                      SizedBox(height: 10),
                      Text(
                        personaje!['name'],
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text('Raza: ${personaje!['race']}'),
                      Text('Genero: ${personaje!['gender']}'),
                      Text('Ki: ${personaje!['ki']}'),
                      Text('Planeta: ${personaje!['originPlanet']['name']}'),
                    ],
                  ));
  }
}
