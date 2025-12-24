import 'package:cinemotion/domain/entities/movie/value_objects/genre.dart';
import 'package:cinemotion/infrastructure/models/the-movie-db/helpers/helpers.dart';
import 'package:cinemotion/infrastructure/models/the-movie-db/helpers/the_movie_db_entity.dart';

class SingleMovieDetails extends TheMovieDbEntity {
  @override
  final bool adult;
  @override
  final String backdropPath;
  final BelongsToCollection? belongsToCollection;
  final int budget;
  @override
  final List<Genre> genres;
  final String homepage;
  @override
  final int id;
  final String imdbId;
  final List<String> originCountry;
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
  final List<ProductionCompany> productionCompanies;
  final List<ProductionCountry> productionCountries;
  @override
  final DateTime? releaseDate;
  final int revenue;
  final int runtime;
  final List<SpokenLanguage> spokenLanguages;
  final String status;
  final String tagline;
  @override
  final String title;
  @override
  final bool video;
  @override
  final double voteAverage;
  @override
  final int voteCount;

  SingleMovieDetails({
    required this.adult,
    required this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory SingleMovieDetails.fromJson(
    Map<String, dynamic> json,
  ) => SingleMovieDetails(
    adult: json["adult"],
    backdropPath: json["backdrop_path"] ?? '',
    belongsToCollection: (json["belongs_to_collection"] == null)
        ? null
        : BelongsToCollection.fromJson(json["belongs_to_collection"]),
    budget: json["budget"],
    genres: GenreParser.parse(json["genres"]),
    homepage: json["homepage"],
    id: json["id"],
    imdbId: json["imdb_id"],
    originCountry: List<String>.from(json["origin_country"].map((x) => x)),
    originalLanguage: json["original_language"] ?? '',
    originalTitle: json["original_title"] ?? '',
    overview: json["overview"] ?? '',
    popularity: json["popularity"]?.toDouble() ?? 0,
    posterPath: json["poster_path"] ?? '',
    productionCompanies: List<ProductionCompany>.from(
      json["production_companies"].map((x) => ProductionCompany.fromJson(x)),
    ),
    productionCountries: List<ProductionCountry>.from(
      json["production_countries"].map((x) => ProductionCountry.fromJson(x)),
    ),
    releaseDate:
        json["release_date"] != null &&
            json["release_date"].toString().isNotEmpty
        ? DateTime.parse(json["release_date"])
        : null,
    revenue: json["revenue"],
    runtime: json["runtime"],
    spokenLanguages: List<SpokenLanguage>.from(
      json["spoken_languages"].map((x) => SpokenLanguage.fromJson(x)),
    ),
    status: json["status"] ?? '',
    tagline: json["tagline"] ?? '',
    title: json["title"] ?? '',
    video: json["video"] ?? '',
    voteAverage: json["vote_average"]?.toDouble() ?? 0,
    voteCount: json["vote_count"] ?? 0,
  );

  @override
  Map<String, dynamic> toJson() => {
    "adult": adult,
    "backdrop_path": backdropPath,
    "belongs_to_collection": belongsToCollection?.toJson(),
    "budget": budget,
    "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
    "homepage": homepage,
    "id": id,
    "imdb_id": imdbId,
    "origin_country": List<dynamic>.from(originCountry.map((x) => x)),
    "original_language": originalLanguage,
    "original_title": originalTitle,
    "overview": overview,
    "popularity": popularity,
    "poster_path": posterPath,
    "production_companies": List<dynamic>.from(
      productionCompanies.map((x) => x.toJson()),
    ),
    "production_countries": List<dynamic>.from(
      productionCountries.map((x) => x.toJson()),
    ),
    "release_date": releaseDate != null
        ? "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}"
        : null,
    "revenue": revenue,
    "runtime": runtime,
    "spoken_languages": List<dynamic>.from(
      spokenLanguages.map((x) => x.toJson()),
    ),
    "status": status,
    "tagline": tagline,
    "title": title,
    "video": video,
    "vote_average": voteAverage,
    "vote_count": voteCount,
  };
}
