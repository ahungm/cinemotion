import 'package:cinemotion/presentation/views/movies/favorites/empty_favorite_movies_message.dart';
import 'package:cinemotion/presentation/views/movies/favorites/search_tonal_button.dart';
import 'package:flutter/material.dart';

class EmptyFavoriteMoviesScaffold extends StatelessWidget {
  const EmptyFavoriteMoviesScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _emptyFavoritesScaffold,
        ),
      ),
    );
  }
}

List<Widget> _emptyFavoritesScaffold = [
  Icon(Icons.favorite, size: 50, color: Colors.blueGrey),
  const SizedBox(height: 30),
  const EmptyFavoriteMoviesMessage(),
  const SizedBox(height: 20),
  const SearchTonalButton(),
];
