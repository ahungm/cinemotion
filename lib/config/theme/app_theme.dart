import 'package:flutter/material.dart';

class AppTheme {
  // Attributes
  final bool isDarkModeEnabled;

  // Constructor
  AppTheme({this.isDarkModeEnabled = true});

  // Methods
  ThemeData getTheme() => ThemeData(
    // ThemeData parameters
    useMaterial3: true,
    colorScheme: isDarkModeEnabled
        ? ColorScheme.dark(
            primary: const Color.fromARGB(255, 220, 9, 108),
            secondary: const Color.fromARGB(241, 253, 212, 212),
          )
        : ColorScheme.light(
            primary: const Color.fromARGB(255, 220, 9, 108),
            secondary: const Color.fromARGB(241, 253, 212, 212),
          ),
    fontFamily: 'Product-Sans',
  );

  // Copy With Method : Allows to manage state of inmutable objects efficiently,
  // by creating a copy of the existing one, but with certain modifications in
  // its fields / attributes

  AppTheme copyWith({bool? isDarkModeEnabled}) {
    return AppTheme(
      isDarkModeEnabled: isDarkModeEnabled ?? this.isDarkModeEnabled,
    );
  }
}
