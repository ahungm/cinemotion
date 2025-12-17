import 'package:animate_do/animate_do.dart';
import 'package:cinemotion/domain/entities/movie.dart';
import 'package:cinemotion/presentation/widgets/movies/carousel/poster/decoration/movie_poster.dart';
import 'package:flutter/material.dart';

class HorizontalListView extends StatefulWidget {
  // Attributes
  final List<Movie> movies;
  final VoidCallback? loadNextPage;

  const HorizontalListView({
    super.key,
    required this.movies,
    this.loadNextPage,
  });

  @override
  State<HorizontalListView> createState() => _HorizontalListViewState();
}

class _HorizontalListViewState extends State<HorizontalListView> {
  // Listeners
  final scrollController = ScrollController();

  // Init Method
  @override
  void initState() {
    super.initState();
    scrollController.addListener(
      () => widget.loadNextPage != null
          ? _loadMoreMovies(scrollController, widget)
          : null,
    );
  }

  // Dispose Method
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  // Build Method
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        controller: scrollController,
        itemCount: widget.movies.length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return FadeInRight(child: MoviePoster(movie: widget.movies[index]));
        },
      ),
    );
  }
}

// Methods
void _loadMoreMovies(ScrollController controller, HorizontalListView ref) {
  if ((controller.position.pixels + 200) >=
      controller.position.maxScrollExtent) {
    ref.loadNextPage!();
  }
}
