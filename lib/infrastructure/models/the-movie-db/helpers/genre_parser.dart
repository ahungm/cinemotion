import 'package:cinemotion/domain/entities/movie/value_objects/genre.dart';

class GenreParser {
  static List<Genre> parse(dynamic json) {
    if (json == null) return const [];

    // Movie details endpoint
    if (json is List && json.isNotEmpty && json.first is Map) {
      return json
          .map((e) => Genre.fromJson(Map<String, dynamic>.from(e)))
          .toList();
    }

    // Movie list endpoints (genre_ids)
    if (json is List) {
      return json.map((id) => Genre(id: id as int, name: '')).toList();
    }

    return const [];
  }
}
