import 'package:cinemotion/infrastructure/datasources/the_movie_db/actor_movie_db_datasource.dart';
import 'package:cinemotion/infrastructure/repositories/actors_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsRepositoryProvider = Provider(
  (ref) => ActorsRepositoryImpl(ActorMovieDbDatasource()),
);
