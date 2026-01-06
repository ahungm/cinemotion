import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  final String _apiKey =
      dotenv.env['THE_MOVIE_DB_API_KEY'] ?? 'An API Key could not be found';

  String get apiKey => _apiKey;
}
