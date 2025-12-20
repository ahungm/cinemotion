import 'package:cinemotion/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MovieArea extends StatelessWidget {
  final Movie movie;

  const MovieArea({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      centerTitle: true,
      titlePadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
      title: Text(
        movie.title,
        style: const TextStyle(
          fontSize: 15,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.start,
      ),
      background: Stack(
        children: [
          SizedBox.expand(
            child: Image.network(movie.posterPath, fit: BoxFit.cover),
          ),
          const Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.7, 1.0], // Begin - End percentage of the gradient
                  colors: [Colors.transparent, Colors.black87],
                ),
              ),
            ),
          ),

          const Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  stops: [0.0, 0.5], // Begin - End percentage of the gradient
                  colors: [Colors.black26, Colors.transparent],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
