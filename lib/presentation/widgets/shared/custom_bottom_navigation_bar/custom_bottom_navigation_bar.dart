import 'package:cinemotion/presentation/widgets/shared/custom_bottom_navigation_bar/bottom_navigation_tab.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final StatefulNavigationShell currentChild;

  const CustomBottomNavigationBar({super.key, required this.currentChild});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    final tabs = BottomNavigationTab.tabs;

    return BottomNavigationBar(
      iconSize: 30,
      landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: _getSelectedIndex(context),
      onTap: (newSelectedIndex) =>
          onSelectedItemTapped(context, newSelectedIndex),
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

void onSelectedItemTapped(BuildContext context, int index) {
  switch (index) {
    case 0:
      context.go('/categories');
      break;
    case 1:
      context.go('/');
      break;
    case 2:
      context.go('/favorites');
      break;
  }
}

int _getSelectedIndex(BuildContext context) {
  final String location = GoRouterState.of(context).matchedLocation;

  switch (location) {
    case '/categories':
      return 0;

    case '/':
      return 1;

    case '/favorites':
      return 2;

    default:
      return 1;
  }
}
