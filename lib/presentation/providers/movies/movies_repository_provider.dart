import 'package:cinemotion/infrastructure/datasources/the_movie_db_datasource.dart';
import 'package:cinemotion/infrastructure/repositories/movies_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Read-Only Provider Implementation - Inmutable repository
// to define a general provider for the other providers
final movieRepositoryProvider = Provider((ref) {
  // Summoning of the specific instance of the selected datasource
  // MoviesRepositoryImpl(datasource);
  return MoviesRepositoryImpl(TheMovieDbDatasource());
});
