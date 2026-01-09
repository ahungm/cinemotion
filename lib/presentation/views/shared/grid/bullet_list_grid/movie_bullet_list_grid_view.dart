import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/views/shared/grid/bullet_list_grid/movie_bullet_item.dart';
import 'package:flutter/material.dart';

class MovieBulletListGridView extends StatefulWidget {
  final List<Movie> movies;
  final VoidCallback? loadNextPage;

  const MovieBulletListGridView({
    super.key,
    required this.movies,
    this.loadNextPage,
  });

  @override
  State<MovieBulletListGridView> createState() =>
      _MovieBulletListGridViewState();
}

class _MovieBulletListGridViewState extends State<MovieBulletListGridView> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(
      () =>
          scrollController.position.pixels + 100 >=
              scrollController.position.maxScrollExtent
          ? widget.loadNextPage!()
          : null,
    );
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: widget.movies.length,
      itemBuilder: (context, index) {
        return MovieBulletItem(movie: widget.movies[index]);
      },
    );
  }
}
