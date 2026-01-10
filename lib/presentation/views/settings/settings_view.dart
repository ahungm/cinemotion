import 'package:cinemotion/presentation/views/shared/menu/settings_items.dart';
import 'package:cinemotion/presentation/views/shared/menu/settings_tile.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(title: Text('Configuraciones')),
      body: ListView.builder(
        physics: ClampingScrollPhysics(),
        itemCount: settingsMenuItems.length,
        itemBuilder: _builItem,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

// Inner Methods
Widget? _builItem(BuildContext context, int index) {
  final SettingsItem item = settingsMenuItems[index];
  return SettingsTile(item: item);
}
