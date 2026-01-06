import 'package:cinemotion/presentation/widgets/shared/search_button/search_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchTonalButton extends ConsumerWidget {
  const SearchTonalButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton.tonal(
      style: const ButtonStyle(visualDensity: VisualDensity.compact),
      onPressed: () => SearchButton.openMovieSearchBar(context, ref),
      child: Text('Buscar películas'),
    );
  }
}
