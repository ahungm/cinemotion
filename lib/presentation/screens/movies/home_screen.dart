import 'package:cinemotion/domain/entities/movie.dart';
import 'package:cinemotion/presentation/providers/movies/movies_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  // Ruta / Nombre de acceso al componente
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _HomeView();
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    // Read of the provider to obtain the data
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Movie> currentMovies = ref.watch(nowPlayingMoviesProvider);

    if (currentMovies.isEmpty) return CircularProgressIndicator();

    return Scaffold(
      body: ListView.builder(
        itemCount: currentMovies.length,
        itemBuilder: (context, index) {
          final movie = currentMovies[index];
          return ListTile(title: Text(movie.title));
        },
      ),
    );
  }
}
