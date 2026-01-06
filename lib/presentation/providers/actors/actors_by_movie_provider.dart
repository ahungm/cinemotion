import 'package:cinemotion/domain/entities/actor/actor.dart';
import 'package:cinemotion/infrastructure/repositories/actors_repository_impl.dart';
import 'package:cinemotion/presentation/providers/actors/actors_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef GetActorsCallback =
    Future<List<Actor>> Function({required String movieId});

class ActorByMovieNotifier extends Notifier<Map<String, List<Actor>>> {
  final Map<String, List<Actor>> actorsByMovieId = {};
  late final GetActorsCallback getActors;

  @override
  Map<String, List<Actor>> build() {
    // Initialize the callback by reading the repository
    final ActorsRepositoryImpl repository = ref.watch(actorsRepositoryProvider);
    getCastInfo(repository.getActorsByMovie);

    // Return the initial state (an empty map)
    return actorsByMovieId;
  }

  // Side Details
  void getCastInfo(GetActorsCallback getFunction) => getActors = getFunction;

  Future<void> loadActors({required String movieId}) async {
    // Check the current state,
    if (state.containsKey(movieId)) return;

    // Get the repository directly from the ref
    final repository = ref.read(actorsRepositoryProvider);

    // Fetch the data
    final List<Actor> actors = await repository.getActorsByMovie(
      movieId: movieId,
    );

    // Update state using spread operator to trigger UI rebuilds
    state = {...state, movieId: actors};
  }
}

final castDetailsProvider =
    NotifierProvider<ActorByMovieNotifier, Map<String, List<Actor>>>(
      ActorByMovieNotifier.new,
    );
