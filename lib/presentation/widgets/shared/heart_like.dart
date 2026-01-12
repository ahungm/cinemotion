import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class HeartLike extends StatelessWidget {
  const HeartLike({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ZoomIn(
        duration: const Duration(milliseconds: 600),
        child: Icon(
          Icons.favorite,
          size: 100,
          color: Colors.white,
          shadows: _shadows,
        ),
      ),
    );
  }
}

// Inner variables
List<Shadow> _shadows = [
  Shadow(
    // .withValues makes % icon more opaque by larger the number
    color: Colors.black.withValues(alpha: 0.45),
    offset: Offset(0, 4),
    blurRadius: 15,
  ),
];
