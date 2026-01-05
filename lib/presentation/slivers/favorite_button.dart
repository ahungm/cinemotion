import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      padding: const EdgeInsets.symmetric(horizontal: 20),
      iconSize: 40,
      icon: const Icon(Icons.favorite_border_outlined),
    );
  }
}
