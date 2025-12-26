import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/widgets/movies/carousel/poster/details/movie_details.dart';
import 'package:flutter/material.dart';
import 'package:jumping_dot/jumping_dot.dart';

// A delegate is used to an object or function used to separate responsibilities,
// allowing one object to handle specific tasks, events, or layout logic on behalf
// of another, more complex object. This promotes cleaner, more modular, and reusable
// code, especially when building UI interfaces

// A Future Builder Widget is used only if exists the necessity to
// build Widgets based on the results of a Future (ex. HTTP Request,
// an async operation)

// The StreamBuilder is designed instead to handle an updates flow
// (it allows to control the events, as well as the specific time to
// emit new values)

typedef GetMoviesCallback = Future<List<Movie>> Function(String query);
typedef GetSelectedMovieCallback = Function(BuildContext context, Movie movie);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
  // Attributes
  final GetMoviesCallback searchMovies;
  List<Movie> initialMovies;

  // It is used broadcast in order to support several listeners to
  // different widgets involved (delegate is always redrawn)

  // Recommended and Overall way to define the StreamController
  final StreamController<List<Movie>> _debouncedMovies =
      StreamController.broadcast();
  final StreamController<bool> _isLoadingStream = StreamController.broadcast();
  Timer? _debounceTimer;

  // Constructor
  SearchMovieDelegate({required this.searchMovies, required this.initialMovies})
    : super(textInputAction: TextInputAction.done);

  // Methods / Functions

  @override
  void dispose() {
    _debouncedMovies.close();
    _isLoadingStream.close();
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _clearStreams() {
    _debouncedMovies.close();
    _isLoadingStream.close();
    _debounceTimer?.cancel();
  }

  void _onQueryChange(String query) {
    // As soon as the person begins to type, it is necessary
    // to emit the isLoadingStream, adding true and/or false values
    // in the general sequence of events or data that flows over time

    _isLoadingStream.add(true);

    // ! print('Cantidad de veces que cambia el query de búsqueda');
    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();

    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      // ! print('Cantidad de veces que se envía la peitción HTTP para buscar una película');
      // if (query.isEmpty) {
      //   _debouncedMovies.add([]);
      //   return;
      // }

      final List<Movie> movies = await searchMovies(query);
      initialMovies = movies;
      _debouncedMovies.add(movies);

      // Add a false value to the isLoadingStream to display the
      // delete search icon
      _isLoadingStream.add(false);
    });
  }

  @override
  String get searchFieldLabel => 'Buscar película';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      StreamBuilder(
        initialData: false,
        stream: _isLoadingStream.stream,
        builder: (context, snapshot) {
          final isLoading = snapshot.data ?? false;
          return (isLoading)
              ? _buildLoadingSearchIcon()
              : _buildDeleteSearchIcon();
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        _clearStreams();
        close(context, null);
      },
      icon: Icon(Icons.arrow_back_ios_new_rounded),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    _onQueryChange(query);
    return _buildMovieSearchStream(context);
  }

  @override
  // Always that a 'build' exist, it can be invoked
  // a state manager to control automatically the
  // changes
  Widget buildSuggestions(BuildContext context) {
    _onQueryChange(query);
    return _buildMovieSearchStream(context);
  }

  Widget _buildMovieSearchStream(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    return StreamBuilder(
      initialData: initialMovies,
      stream: _debouncedMovies.stream,
      builder: (context, snapshot) {
        // ! print ('Número de peticiones realizadas al servidor cada vez que se hace una búsqueda)
        if (snapshot.connectionState == ConnectionState.waiting) {
          Center(
            child: JumpingDots(
              color: colors.primary,
              innerPadding: 5,
              radius: 10,
              numberOfDots: 3,
              animationDuration: const Duration(milliseconds: 200),
            ),
          );
        }

        final movies = snapshot.data ?? [];
        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final Movie movie = movies[index];
            return MovieSearchItem(
              movie: movie,
              onMovieSelected: (context, movie) {
                _clearStreams();
                close(context, movie);
              },
            );
          },
        );
      },
    );
  }

  Widget _buildDeleteSearchIcon() => FadeIn(
    animate: query.isNotEmpty,
    duration: const Duration(milliseconds: 250),
    child: IconButton(
      onPressed: () => query = '',
      icon: const Icon(Icons.clear),
    ),
  );

  Widget _buildLoadingSearchIcon() => SpinPerfect(
    duration: const Duration(seconds: 2),
    spins: 10,
    infinite: true,
    child: IconButton(
      onPressed: () => query = '',
      icon: const Icon(Icons.refresh_rounded),
    ),
  );
}

class MovieSearchItem extends StatelessWidget {
  final Movie movie;
  final GetSelectedMovieCallback onMovieSelected;

  const MovieSearchItem({
    super.key,
    required this.movie,
    required this.onMovieSelected,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => onMovieSelected(context, movie),
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 15, horizontal: 20),
        child: Row(
          children: [
            SizedBox(
              width: size.width * 0.2,
              child: AspectRatio(
                aspectRatio: 2.25 / 4,
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(10),
                  child: Image.network(
                    movie.posterPath,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) =>
                        FadeIn(child: child),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: SizedBox(
                width: size.width * 0.7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    (movie.overview.length > 100)
                        ? Text(
                            textAlign: TextAlign.start,
                            '${movie.overview.substring(0, 100)}...',
                          )
                        : Text(movie.overview),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        MovieRating(
                          color: Colors.amber.shade900,
                          rating: movie.voteAverage,
                        ),
                        const SizedBox(width: 15),
                        const Icon(Icons.remove_red_eye_rounded, size: 18),
                        const SizedBox(width: 5),
                        MovieViews(viewsCount: movie.popularity),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
