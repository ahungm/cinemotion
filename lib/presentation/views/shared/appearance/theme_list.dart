import 'package:cinemotion/presentation/views/shared/appearance/enum/appearance_mode.dart';
import 'package:flutter/material.dart';

class ThemeList extends StatelessWidget {
  const ThemeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: AppearanceMode.values
          .map((mode) => _buildRadioList(mode))
          .toList(),
    );
  }
}

// Inner Methods
RadioListTile<AppearanceMode> _buildRadioList(AppearanceMode mode) {
  return RadioListTile(
    title: Text(mode.title),
    subtitle: Text(mode.description),
    value: mode,
  );
}
