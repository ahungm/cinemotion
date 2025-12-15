import 'package:cinemotion/presentation/widgets/shared/custom_bottom_navigation_bar/bottom_navigation_tab.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    final tabs = BottomNavigationTab.tabs;

    return BottomNavigationBar(
      iconSize: 25,
      landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: selectedIndex,
      onTap: (newSelectedIndex) =>
          setState(() => selectedIndex = newSelectedIndex),
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      items: [..._buildNavigationBarItems(tabs: tabs, scheme: colors)],
    );
  }
}

// Methods
List<BottomNavigationBarItem> _buildNavigationBarItems({
  required List<BottomNavigationTab> tabs,
  required ColorScheme scheme,
}) {
  return tabs.map((tab) {
    return BottomNavigationBarItem(
      icon: tab.icon,
      activeIcon: tab.activeIcon,
      label: tab.label,
      backgroundColor: scheme.primary,
    );
  }).toList();
}
