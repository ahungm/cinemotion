import 'package:cinemotion/config/theme/themes.dart';
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
    colorScheme: isDarkModeEnabled ? darkModeScheme : lightModeScheme,
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
