// Defines the data model for a single movie

// If an error occurs with the data provided by the API, can be checked in this class
// since it formats the responds from the external source (DTO)

import 'package:cinemotion/domain/entities/movie/value_objects/genre.dart';
import 'package:cinemotion/infrastructure/models/the-movie-db/helpers/genre_parser.dart';
import 'package:cinemotion/infrastructure/models/the-movie-db/helpers/the_movie_db_entity.dart';

class MovieFromTheMovieDB extends TheMovieDbEntity {
  @override
  final bool adult;
  @override
  final String backdropPath;
  final List<Genre> genreIds;
  @override
  final int id;
  @override
  final String originalLanguage;
  @override
  final String originalTitle;
  @override
  final String overview;
  @override
  final double popularity;
  @override
  final String posterPath;
  @override
  final DateTime releaseDate;
  @override
  final String title;
  @override
  final bool video;
  @override
  final double voteAverage;
  @override
  final int voteCount;

  MovieFromTheMovieDB({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieFromTheMovieDB.fromJson(Map<String, dynamic> json) =>
      MovieFromTheMovieDB(
        adult: json["adult"] ?? '',
        backdropPath: json["backdrop_path"] ?? '',
        genreIds: GenreParser.parse(json["genres"] ?? json["genre_ids"]),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"] ?? '',
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"] ?? '',
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
      );

  @override
  Map<String, dynamic> toJson() => {
    "adult": adult,
    "backdrop_path": backdropPath,
    "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
    "id": id,
    "original_language": originalLanguage,
    "original_title": originalTitle,
    "overview": overview,
    "popularity": popularity,
    "poster_path": posterPath,
    "release_date":
        "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
    "title": title,
    "video": video,
    "vote_average": voteAverage,
    "vote_count": voteCount,
  };

  @override
  List<Genre> get genres => genreIds;
}
