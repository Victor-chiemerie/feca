import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade200,
    primary: Colors.grey.shade500,
    secondary: Colors.grey.shade900,
    tertiary: Colors.green.shade800,
    tertiaryFixedDim: Colors.green.shade200,
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade900,
    primary: Colors.grey.shade700,
    secondary: Colors.grey.shade50,
    tertiary: Colors.green.shade300,
    tertiaryFixedDim: Colors.green.shade200,
  ),
);
