import 'movie_from_the_movie_db.dart';
import 'utils/dates.dart';

// Maps the entire response from the TheMovieDB API, including
// the list of movies an another details

// DTO (Data Transfer Object): It is a pattern that allows to
// create data structures isolated from the data model (Entities)

// Alongside with the Adapter Pattern (Presentation Layer), it
// helps to avoid poisoning the Domain Layer from Infrastructure details,
// since they are established as classes that just store information
// (they do not have methods defined, but only constructors)

class TheMovieDbResponse {
  Dates? dates;
  int page;
  List<MovieFromTheMovieDB> results;
  int totalPages;
  int totalResults;

  TheMovieDbResponse({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory TheMovieDbResponse.fromJson(Map<String, dynamic> json) =>
      TheMovieDbResponse(
        dates: json["dates"] ? Dates.fromJson(json["dates"]) : null,
        page: json["page"],
        results: List<MovieFromTheMovieDB>.from(
          json["results"].map((x) => MovieFromTheMovieDB.fromJson(x)),
        ),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
    // "dates": dates == null ? null : dates!.toJson(),
    "dates": dates?.toJson(),
    "page": page,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
    "total_pages": totalPages,
    "total_results": totalResults,
  };
}
