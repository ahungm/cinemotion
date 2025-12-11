// Create a Movie Entity based on the type of
// object received (API Response --> Mapper --> Entity)

// (Ex: TheMovieDB --> TheMovieDBMapper)

import '/domain/entities/movie.dart';
import '/infrastructure/models/the-movie-db/movie_from_the_movie_db.dart';

class MovieMapper {
  static Movie theMovieDBToEntity(MovieFromTheMovieDB moviedb) => Movie(
    adult: moviedb.adult,
    backdropPath: (moviedb.backdropPath != '')
        ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
        : 'https://easimages.basnop.com/default-image_600.png',
    genreIds: moviedb.genreIds.map((genre) => genre.toString()).toList(),
    id: moviedb.id,
    originalLanguage: moviedb.originalLanguage,
    originalTitle: moviedb.originalTitle,
    overview: moviedb.overview,
    popularity: moviedb.popularity,
    posterPath: (moviedb.posterPath != '')
        ? 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}'
        : 'poster-not-found',
    releaseDate: moviedb.releaseDate,
    title: moviedb.title,
    video: moviedb.video,
    voteAverage: moviedb.voteAverage,
    voteCount: moviedb.voteCount,
  );
}
