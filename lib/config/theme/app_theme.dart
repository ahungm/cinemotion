import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
    // ThemeData parameters
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(
      primary: const Color.fromARGB(255, 220, 9, 108),
      secondary: const Color.fromARGB(241, 253, 212, 212),
      brightness: Brightness.light,
    ),
    fontFamily: 'Product-Sans',
  );
}
