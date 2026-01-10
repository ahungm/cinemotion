import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class ActorProfileImage extends StatelessWidget {
  final String imagePath;

  const ActorProfileImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          imagePath,
          height: 200,
          width: 135,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
