import 'package:flutter/material.dart';

import 'settings.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Configuraciones')),
      body: ListView(
        physics: ClampingScrollPhysics(),
        children: _buildListElements(),
      ),
    );
  }
}

List<Widget> _buildListElements() => [DisplayModeTile()];
