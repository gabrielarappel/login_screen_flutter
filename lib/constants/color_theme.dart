import 'package:flutter/material.dart';

class ColorTheme {
  static Color background = Colors.grey.shade800;

   static LinearGradient linearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.orange[900] ?? Colors.orange,
      Colors.orange[800] ?? Colors.orange,
      Colors.orange[400] ?? Colors.orange
    ],
  );

  static Color white = Colors.white;

  static Color grey = Color.fromARGB(255, 79, 79, 79);
  

}