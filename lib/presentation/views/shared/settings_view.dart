import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Configuraciones')),
      body: ListView(
        physics: ClampingScrollPhysics(),
        children: [ListTile(title: Text('Hola'))],
      ),
    );
  }
}
