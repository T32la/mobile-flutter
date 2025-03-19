import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  const AppBarCustom({super.key})
    : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Znews'),
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      actions: [
        IconButton(
          icon: Icon(Icons.message_outlined, color: Colors.white),
          onPressed: () {
            // Ejecutar cualquier accion
          },
        ),
      ],
    );
  }
}
