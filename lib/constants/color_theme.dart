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
  static Color orange = Colors.orange;
  static Color deepOrangeAccent = Colors.deepOrangeAccent;

  static Color white = Colors.white;

  static Color greyField = const Color.fromARGB(255, 79, 79, 79);
  static Color grey = Colors.grey;

  static Color red = Colors.red;
}
