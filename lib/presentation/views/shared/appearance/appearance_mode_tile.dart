import 'package:cinemotion/presentation/providers/theme/theme_notifier.dart';
import 'package:cinemotion/presentation/views/shared/appearance/theme_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'enum/appearance_mode.dart';

class AppearanceModeTile extends ConsumerStatefulWidget {
  static const name = 'appearance_mode_tile';

  const AppearanceModeTile({super.key});

  @override
  ConsumerState<AppearanceModeTile> createState() => _AppearanceModeTileState();
}

class _AppearanceModeTileState extends ConsumerState<AppearanceModeTile> {
  @override
  Widget build(BuildContext context) {
    // Watch the current theme state to keep the radio buttons in sync
    final appTheme = ref.watch(themeNotifierProvider);
    final selectedMode = appTheme.isDarkModeEnabled
        ? AppearanceMode.dark
        : AppearanceMode.light;

    return Scaffold(
      appBar: AppBar(title: Text('Cambiar Apariencia')),
      body: RadioGroup<AppearanceMode>(
        groupValue: selectedMode,
        onChanged: (value) => _changeGlobalTheme(value),
        child: const ThemeList(),
      ),
    );
  }

  // Inner Methods
  void _changeGlobalTheme(AppearanceMode? value) {
    if (value != null) {
      // This triggers the global theme change
      ref.read(themeNotifierProvider.notifier).toggleDarkMode();
    }
  }
}
