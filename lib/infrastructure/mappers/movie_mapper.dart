// Create a Movie Entity based on the type of
// object received (API Response --> Mapper --> Entity)

// (Ex: TheMovieDB --> TheMovieDBMapper)

import 'package:cinemotion/infrastructure/models/the-movie-db/helpers/the_movie_db_entity.dart';

import '/domain/entities/movie.dart';

class MovieMapper {
  static Movie theMovieDbToEntity<T extends TheMovieDbEntity>(T movieDb) =>
      Movie(
        adult: movieDb.adult,
        backdropPath: (movieDb.backdropPath != '')
            ? 'https://image.tmdb.org/t/p/w500${movieDb.backdropPath}'
            : 'https://easimages.basnop.com/default-image_600.png',
        genreIds: movieDb.genres.map((genre) => genre.toString()).toList(),
        id: movieDb.id,
        originalLanguage: movieDb.originalLanguage,
        originalTitle: movieDb.originalTitle,
        overview: movieDb.overview,
        popularity: movieDb.popularity,
        posterPath: (movieDb.posterPath != '')
            ? 'https://image.tmdb.org/t/p/w500${movieDb.posterPath}'
            : 'poster-not-found',
        releaseDate: movieDb.releaseDate,
        title: movieDb.title,
        video: movieDb.video,
        voteAverage: movieDb.voteAverage,
        voteCount: movieDb.voteCount,
      );
}
