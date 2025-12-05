import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  // Ruta / Nombre de acceso al componente
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _HomeView();
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('')));
  }
}
