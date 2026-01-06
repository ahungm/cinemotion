import 'package:cinemotion/domain/datasources/actors_datasource.dart';
import 'package:cinemotion/domain/entities/actor/actor.dart';
import 'package:cinemotion/domain/repositories/actors_repository.dart';

class ActorsRepositoryImpl implements ActorsRepository {
  // This allow to have a low coupling datasource, since
  // it would work on the abstraction instead of a concrete
  // implementation (in this case, TheMovieDB), applying
  // flawlessly the Liskov Substitute Principle (LSP), by
  // letting any class that extends from ActorsDatasource
  // to be injected in the repository
  final ActorsDatasource datasource;

  // Datasource implementation within the repository
  ActorsRepositoryImpl(this.datasource);

  @override
  Future<List<Actor>> getActorsByMovie({required String movieId}) {
    return datasource.getActorsByMovie(movieId: movieId);
  }
}
