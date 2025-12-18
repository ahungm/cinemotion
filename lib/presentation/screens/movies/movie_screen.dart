import 'package:flutter/material.dart';

class MovieScreen extends StatelessWidget {
  static const String name = 'movie-screen';

  // Attributes
  final String movieId;

  // Constructor
  const MovieScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('')),
      body: Center(child: Text('Movie ID: $movieId')),
    );
  }
}
