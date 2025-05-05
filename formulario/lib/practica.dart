/* En esta práctica construirás un formulario en Flutter para registrar libros. 
El formulario debe incluir campos como título, autor, editorial, año y género. 
Al completar y enviar el formulario, los datos deben enviarse a una base de datos en Firebase Realtime Database.
Asegúrate de usar tu propia URL de Firebase en la petición POST.
Sigue las instrucciones por fases que encontrarás comentadas a lo largo del archivo para estructurar tu código.*/

/**
 * @autores
 * Victoriano Juarez
 * Kevin Anay

 * 
 */

// importaciones necesarias
// - Material de Flutter
// - http para hacer peticiones
// - convert para convertir datos a JSON
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Crear un StatefulWidget llamado LibrosForm
class LibrosForm extends StatefulWidget {
  const LibrosForm({super.key});
  @override
  _LibrosFormState createState() => _LibrosFormState();
}

// Crear el estado (_LibrosFormState) del widget LibrosForm
class _LibrosFormState extends State<LibrosForm> {
// Declarar una clave glddobal para el formulario (GlobalKey<FormState>)
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _autorController = TextEditingController();
  final TextEditingController _editorialController = TextEditingController();
  final TextEditingController _anioController = TextEditingController();

  // final TextEditingController _generoController = TextEditingController();
  String? _selectedGenero;

// Crear una lista de géneros (Ficción, No ficción, Fantasía, Ciencia, Historia)
  final List<String> generos = [
    "Ficción",
    "No ficción",
    "Fantasía",
    "Ciencia",
    "Historia"
  ];

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final data = {
// Crear controladores de texto para:
// - título
        'titulo': _tituloController.text,
// - autor
        'autor': _autorController.text,
// - editorial
        'editorial': _editorialController.text,
// - año
        'anio': _anioController.text,
// Declarar una variable para el género seleccionado (String?)
        'genero': _selectedGenero
      };

// Crear una función asíncrona para enviar el formulario:

// - Validar el formulario
      final response = await http.post(
        Uri.parse(
            'https://deportes-soccer-default-rtdb.firebaseio.com/Libros.json'), // Reemplaza con tu URL de la API
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data),
      );
// - Construir un mapa con los datos ingresados (título, autor, editorial, año, género, timestamp)
// - Realizar una petición POST a Firebase
//   - IMPORTANTE: Reemplazar la URL con el path de Firebase personal de cada estudiante
//     Ejemplo: 'https://<tu-proyecto>.firebaseio.com/libros.json'
// - Mostrar un mensaje en pantalla dependiendo si fue exitoso o no

      if (response.statusCode == 200) {
        // Si la respuesta es exitosa, puedes mostrar un mensaje o limpiar el formulario
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Libro creado con éxito')));
      } else {
        // Si hubo un error
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Error al crear el libro')));
      }
    }
  }
  

// En el método build:
// - Devolver un Scaffold con AppBar que diga "Formulario Libros"
// - Dentro del body, usar Padding y Form con la clave del formulario

  @override
  Widget build(BuildContext context) {
// Agregar los siguientes campos con validaciones:
// - TextFormField para el título
// - TextFormField para el autor
// - TextFormField para la editorial
// - TextFormField para el año
// - DropdownButtonFormField para el género (usar la lista declarada antes)

// Agregar un botón ElevatedButton que al presionar ejecute la función para enviar el formulario
    return Scaffold(
      appBar: AppBar(title: Text('Formulario Libros')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _tituloController,
                decoration: InputDecoration(labelText: 'Titulo'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa el Titulo';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _autorController,
                decoration: InputDecoration(labelText: 'Autor'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa el nombre Autor';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _editorialController,
                decoration: InputDecoration(labelText: 'Editorial'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa la Editorial';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: _selectedGenero,
                decoration: InputDecoration(labelText: 'Genero'),
                items: generos.map((facultad) {
                  return DropdownMenuItem<String>(
                    value: facultad,
                    child: Text(facultad),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedGenero = newValue;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor selecciona un Genero';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _anioController,
                decoration: InputDecoration(labelText: 'Año'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa el Año';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Crear'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
