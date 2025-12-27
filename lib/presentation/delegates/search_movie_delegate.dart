import 'dart:async';

import 'package:cinemotion/domain/entities/movie/movie.dart';

import 'package:cinemotion/presentation/delegates/helpers/movie_delegates.dart';
import 'package:flutter/material.dart';

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
    return [ActionStreamBuilder(stream: _isLoadingStream.stream, query: query)];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        _clearStreams();
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
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
    return MovieSearchResults(
      stream: _debouncedMovies.stream,
      initialData: initialMovies,
      onMovieSelected: (context, movie) {
        _clearStreams(); // Clean up memory
        close(
          context,
          movie,
        ); // Return the result to the caller and close the stream
      },
    );
  }
}
