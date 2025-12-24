import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/delegates/search_movie_delegate.dart';
import 'package:cinemotion/presentation/providers/movies/movies_repository_provider.dart';
import 'package:cinemotion/presentation/widgets/shared/custom_app_bar/app_bar_icon.dart';
import 'package:cinemotion/presentation/widgets/shared/custom_app_bar/app_bar_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AppBarRow extends StatelessWidget {
  // Constructor
  const AppBarRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [...appBarElements]);
  }
}

List<Widget> appBarElements = [
  const AppBarIcon(),
  const SizedBox(width: 5),
  const AppBarText(),
  const Spacer(), // Allows to define flexible space between elements
  const SearchButton(),
];

class SearchButton extends ConsumerWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Define movieRepository available
    final movieRepository = ref.read(movieRepositoryProvider);

    return IconButton(
      icon: const Icon(Icons.search),
      onPressed: () async {
        // Execute the search
        final Movie? movie = await showSearch<Movie?>(
          context: context,
          delegate: SearchMovieDelegate(
            searchMovies: movieRepository.searchMovies,
          ),
        );

        // Check if the widget is still referenced in the tree before using context
        if (!context.mounted) return;

        // Navigate if a movie was selected
        if (movie != null) {
          context.push('/movie/${movie.id.toString()}');
        }
      },
    );
  }
}

// Is not applied and onTap: () => context.go('/movie/${movie.id.toString()}')
// since is required to perfom several overations; not only navigate in the
// search interface, but to also clean the delagate streams in order to
// show the details of the movie later on (free resources)
