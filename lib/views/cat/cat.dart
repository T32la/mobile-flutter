import 'package:flutter/material.dart';

// State
class CatWidget extends StatefulWidget {
  final String id;
  final List<String>? tags; // Agregar etiquetas como parámetro opcional

  CatWidget({Key? key, required this.id, this.tags}) : super(key: key);

  @override
  _CatWidgetState createState() => _CatWidgetState();
}

// Class with design of WidgetCat
class _CatWidgetState extends State<CatWidget> {
  // Variable para detectar si se está cargando
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // No es necesario hacer una solicitud adicional para obtener la imagen
    setState(() {
      isLoading = false; // Directamente cargar la imagen
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isLoading
          ? CircularProgressIndicator()
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  "https://cataas.com/cat/${widget.id}", // URL directa para la imagen
                  height: 300,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.error),
                ),
                const SizedBox(height: 20),
                Text(widget.tags?.join(", ") ??
                    "Sin etiquetas"), // Mostrar etiquetas
              ],
            ),
    );
  }
}
