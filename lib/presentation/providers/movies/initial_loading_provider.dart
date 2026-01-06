// Read-Only Provider since the change is controlled automatically

import 'package:cinemotion/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';

final initialLoadingProvider = Provider<bool>(
  (ref) => !_areMoviesAlreadyRendered(ref),
);

bool _areMoviesAlreadyRendered(Ref ref) {
  final providers = <ProviderListenable>[
    nowPlayingMoviesProvider,
    movieSlideshowProvider,
    upcomingMoviesProvider,
    popularMoviesProvider,
    topRatedMoviesProvider,
  ];

  // For each statement
  for (final provider in providers) {
    if (ref.watch(provider).isNotEmpty) return true;
  }

  return false;
}
