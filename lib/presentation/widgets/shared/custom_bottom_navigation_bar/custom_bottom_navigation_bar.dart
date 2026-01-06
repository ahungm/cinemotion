import 'package:cinemotion/presentation/widgets/shared/custom_bottom_navigation_bar/bottom_navigation_tab.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int index;
  const CustomBottomNavigationBar({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    final tabs = BottomNavigationTab.tabs;

    return BottomNavigationBar(
      iconSize: 30,
      landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: index,
      onTap: (newSelectedIndex) => context.go('/home/$newSelectedIndex'),
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
