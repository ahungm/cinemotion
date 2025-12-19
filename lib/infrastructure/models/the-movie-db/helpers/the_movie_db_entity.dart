import 'package:cinemotion/infrastructure/models/the-movie-db/helpers/genre.dart';

abstract class TheMovieDbEntity {
  bool get adult;
  String get backdropPath;
  List<Genre> get genres;
  int get id;
  String get originalLanguage;
  String get originalTitle;
  String get overview;
  double get popularity;
  String get posterPath;
  DateTime get releaseDate;
  String get title;
  bool get video;
  double get voteAverage;
  int get voteCount;

  //  Method
  Map<String, dynamic> toJson();
}
