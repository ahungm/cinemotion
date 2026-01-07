import 'package:cinemotion/presentation/providers/theme/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'enum/display_mode.dart';

class DisplayModeTile extends ConsumerStatefulWidget {
  const DisplayModeTile({super.key});

  @override
  ConsumerState<DisplayModeTile> createState() => _DisplayModeTileState();
}

class _DisplayModeTileState extends ConsumerState<DisplayModeTile> {
  @override
  Widget build(BuildContext context) {
    // Watch the current theme state to keep the radio buttons in sync
    final appTheme = ref.watch(themeNotifierProvider);
    final selectedMode = appTheme.isDarkModeEnabled
        ? DisplayMode.dark
        : DisplayMode.light;

    return ExpansionTile(
      title: const Text('Cambiar apariencia'),
      subtitle: Text('Modo: ${selectedMode.title}'),
      children: [
        RadioGroup<DisplayMode>(
          groupValue: selectedMode,
          onChanged: (DisplayMode? value) {
            if (value != null) {
              // URGENT: This triggers the global theme change
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
            }
          },
          child: Column(
            children: DisplayMode.values.map((mode) {
              return RadioListTile<DisplayMode>(
                title: Text(mode.title),
                subtitle: Text(mode.description),
                value: mode,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
