import 'package:cinemotion/presentation/views/shared/menu/settings_items.dart';
import 'package:cinemotion/presentation/views/shared/menu/settings_tile.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Configuraciones')),
      body: ListView.builder(
        physics: ClampingScrollPhysics(),
        itemCount: settingsMenuItems.length,
        itemBuilder: _builItem,
      ),
    );
  }
}

// Inner Methods
Widget? _builItem(BuildContext context, int index) {
  final SettingsItem item = settingsMenuItems[index];
  return SettingsTile(item: item);
}
