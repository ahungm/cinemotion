import 'package:cinemotion/presentation/widgets/shared/custom_bottom_navigation_bar/navigation_bar_icon.dart';
import 'package:flutter/material.dart';

class BottomNavigationTab {
  // Attributes
  final Widget icon;
  final Widget activeIcon;
  final String? label;

  // Constructor
  const BottomNavigationTab({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });

  // Static Method
  static List<BottomNavigationTab> get tabs => [
    BottomNavigationTab(
      icon: NavigationBarIcon(data: Icons.label_outline),
      activeIcon: NavigationBarIcon(data: Icons.label),
      label: 'Categories',
    ),
    BottomNavigationTab(
      icon: NavigationBarIcon(data: Icons.home),
      activeIcon: NavigationBarIcon(data: Icons.home_filled),
      label: 'Home',
    ),
    BottomNavigationTab(
      icon: NavigationBarIcon(data: Icons.favorite_border),
      activeIcon: NavigationBarIcon(data: Icons.favorite),
      label: 'Favorites',
    ),
  ];
}
