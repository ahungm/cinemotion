import 'package:cinemotion/domain/entities/movie.dart';
import 'package:cinemotion/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef GetMovieCallback = Future<Movie> Function({required String id});

class MovieMapNotifier extends Notifier<Map<String, Movie>> {
  final String id = '';
  final Map<String, Movie> movieIds = {};
  late final GetMovieCallback getMovie;

  @override
  Map<String, Movie> build() {
    final movieRepository = ref.watch(movieRepositoryProvider);
    getMovieInfo(movieRepository.getMovieById);
    return movieIds;
  }

  // Side Effect Methods

  // Initialize
  void getMovieInfo(GetMovieCallback getFunction) => getMovie = getFunction;

  Future<void> loadMovie({required String id}) async {
    if (state[id] != null) return;
    final movie = await getMovie(id: id);
    state = {...state, id: movie};
  }
}

final movieInfoProvider =
    NotifierProvider<MovieMapNotifier, Map<String, Movie>>(
      MovieMapNotifier.new,
    );
