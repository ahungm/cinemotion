import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
    // ThemeData parameters
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      primary: const Color.fromARGB(255, 220, 9, 108),
      secondary: const Color.fromARGB(242, 118, 116, 116),
      brightness: Brightness.light,
    ),
    fontFamily: 'Product-Sans',
  );
}
