import 'package:cinemotion/presentation/delegates/search_movie_delegate.dart';
import 'package:cinemotion/presentation/providers/movies/movies_repository_provider.dart';
import 'package:cinemotion/presentation/widgets/shared/custom_app_bar/app_bar_icon.dart';
import 'package:cinemotion/presentation/widgets/shared/custom_app_bar/app_bar_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    final movieRepository = ref.read(movieRepositoryProvider);

    return IconButton(
      onPressed: () {
        showSearch(
          context: context,
          delegate: SearchMovieDelegate(
            searchMovies: movieRepository.searchMovies,
          ),
        );
      },
      icon: Icon(Icons.search),
    );
  }
}
