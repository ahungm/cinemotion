import 'package:flutter/material.dart';

class SettingsItem {
  // Attributes
  final String title;
  final String? subtitle;
  final String url;
  final IconData icon;

  // Constructor
  const SettingsItem({
    required this.title,
    required this.icon,
    this.subtitle,
    required this.url,
  });
}

const List<SettingsItem> settingsMenuItems = [
  SettingsItem(
    title: 'Cambiar Apariencia',
    icon: Icons.light_mode,
    subtitle: 'Cambiar el color del tema de la aplicación',
    url: 'settings',
  ),
];
