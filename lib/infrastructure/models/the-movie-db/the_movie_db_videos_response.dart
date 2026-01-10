import 'helpers/details.dart';

class TheMovieDbVideosResponse {
  final int id;
  final List<Details> details;

  TheMovieDbVideosResponse({required this.id, required this.details});

  factory TheMovieDbVideosResponse.fromJson(Map<String, dynamic> json) =>
      TheMovieDbVideosResponse(
        id: json["id"],
        details: List<Details>.from(
          json["results"].map((x) => Details.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "results": List<dynamic>.from(details.map((x) => x.toJson())),
  };
}
