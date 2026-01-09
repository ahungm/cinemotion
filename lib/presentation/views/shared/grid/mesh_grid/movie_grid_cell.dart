import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MovieGridCell extends StatelessWidget {
  final Movie movie;

  const MovieGridCell({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final random = Random();

    return FadeInUp(
      from: random.nextInt(100) + 80,
      delay: Duration(milliseconds: random.nextInt(450)),
      child: Container(
        // This pushes the edges of the poster inward,
        // creating a white space area for the shadow to appear
        margin: const EdgeInsets.symmetric(horizontal: 1.5, vertical: 1.5),

        // Apply the BoxShadow to the outside of the frame (container)
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(50, 50, 93, 0.25),
              blurRadius: 5,
              spreadRadius: -1,
              offset: Offset(0, 2),
            ),
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.3),
              blurRadius: 3,
              spreadRadius: -1,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: ClipRRect(
          // Content (Image)
          borderRadius: BorderRadius.circular(10),
          child: GestureDetector(
            onTap: () => context.push('/home/0/movie/${movie.id}'),
            child: FadeInImage(
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              placeholderFit: BoxFit.scaleDown,
              placeholder: const AssetImage('assets/loaders/film_reel.gif'),
              image: NetworkImage(movie.posterPath),
            ),
          ),
        ),
      ),
    );
  }
}
