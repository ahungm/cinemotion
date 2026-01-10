import 'package:flutter/material.dart';

class LanguageTile extends StatelessWidget {
  static const name = 'language_tile';

  const LanguageTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Cambiar Idioma')));
  }
}
