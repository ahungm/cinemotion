import 'package:cinemotion/presentation/providers/storage/local_storage_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// family<bool, int> : Left = Return Value ; Right = Parameter/Argument Value

final isFavoriteMovieProvider = FutureProvider.family<bool, int>((
  ref,
  movieId,
) {
  final localRepository = ref.watch(localStorageRepositoryProvider);
  return localRepository.isFavoriteMovie(movieId);
});
