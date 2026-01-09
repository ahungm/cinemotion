import 'package:cinemotion/domain/entities/movie/movie.dart';
import 'package:cinemotion/presentation/slivers/favorite_button.dart';
import 'package:cinemotion/presentation/widgets/movies/carousel/poster/details/movie_rating.dart';
import 'package:cinemotion/presentation/widgets/movies/carousel/poster/details/movie_views.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MovieBulletItem extends StatelessWidget {
  final Movie movie;

  const MovieBulletItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => context.push('/home/0/movie/${movie.id}'),
            child: Row(
              children: [
                SizedBox(
                  width: 75,
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(50, 50, 93, 0.25),
                            blurRadius: 5,
                            spreadRadius: -1,
                            offset: Offset(0, 2),
                          ),
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.3),
                            blurRadius: 3,
                            spreadRadius: -1,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: FadeInImage(
                          height: double.infinity,
                          fit: BoxFit.cover,
                          placeholderFit: BoxFit.contain,
                          placeholder: const AssetImage(
                            'assets/loaders/film_reel.gif',
                          ),
                          image: NetworkImage(movie.posterPath),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                // Wrap the Text in Expanded to prevent horizontal overflow
                Expanded(
                  child: Text(
                    movie.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                SizedBox(
                  width: 63,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MovieRating(
                        color: Colors.amber,
                        rating: movie.voteAverage,
                        iconSize: 18,
                      ),
                      const SizedBox(height: 5),
                      MovieViews(viewsCount: movie.popularity),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 5),
        FavoriteButton(movie: movie, size: 20),
      ],
    );
  }
}
