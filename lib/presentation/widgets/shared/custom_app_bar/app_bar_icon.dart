import 'package:flutter/material.dart';

class AppBarIcon extends StatelessWidget {
  // Constructor
  const AppBarIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Icon(Icons.movie_creation_outlined, color: colors.primary),
    );
  }
}
