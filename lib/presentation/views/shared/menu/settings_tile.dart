import 'package:cinemotion/presentation/providers/providers.dart';
import 'package:cinemotion/presentation/views/shared/menu/settings_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SettingsTile extends ConsumerWidget {
  // Attributes
  final SettingsItem item;

  // Constructor
  const SettingsTile({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    // Watch the change of the general theme of the app
    final appTheme = ref.watch(themeNotifierProvider);

    // Store the state of the theme
    final bool isDarkModeEnabled = appTheme.isDarkModeEnabled;

    return ListTile(
      leading: _buildLeadingIcon(isDarkModeEnabled),
      title: Text(item.title),
      subtitle: Text(item.subtitle!),
      splashColor: colors.primary,
      trailing: Icon(Icons.arrow_forward_ios_rounded),
      onTap: () => context.push('/home/3/${item.url}'),
    );
  }

  // Inner Methods
  Widget _buildLeadingIcon(bool isDarkModeEnabled) {
    // Variable to store leading icon of the item tile
    final Widget leadingIcon;

    // Only change to dark mode icon if this specific tile is for Appearance
    if (item.url.contains('appearance')) {
      leadingIcon = Icon(isDarkModeEnabled ? Icons.dark_mode : item.icon);
    } else {
      leadingIcon = Icon(item.icon); // Use the default icon for Language, etc.
    }
    return leadingIcon;
  }
}
