import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: const Color.fromRGBO(212, 139, 28, 0.879),
      brightness: Brightness.dark);
}
