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
  final GetMoviesCallback searchMovies;
  List<Movie> initialMovies;

  final StreamController<List<Movie>> _debouncedMovies =
      StreamController.broadcast();
  final StreamController<bool> _isLoadingStream = StreamController.broadcast();
  Timer? _debounceTimer;

  SearchMovieDelegate({required this.searchMovies, required this.initialMovies})
    : super(textInputAction: TextInputAction.done);

  void _onQueryChange(String query) {
    _isLoadingStream.add(true);
    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();

    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      final movies = await searchMovies(query);
      initialMovies = movies;
      if (!_debouncedMovies.isClosed) {
        _debouncedMovies.add(movies);
        _isLoadingStream.add(false);
      }
    });
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _debouncedMovies.close();
    _isLoadingStream.close();
    super.dispose();
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      ActionStreamBuilder(
        stream: _isLoadingStream.stream,
        isQueryEmpty: query.isEmpty,
        onClearQuery: () =>
            query = '', // This works here because it's inside the Delegate
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    _onQueryChange(query);
    return _buildMovieSearchStream();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _onQueryChange(query);
    return _buildMovieSearchStream();
  }

  Widget _buildMovieSearchStream() {
    return MovieSearchResults(
      stream: _debouncedMovies.stream,
      initialData: initialMovies,
      onMovieSelected: (context, movie) {
        // DO NOT call _clearStreams() here.
        // The dispose() method handles it when the delegate closes.
        close(context, movie);
      },
    );
  }
}
