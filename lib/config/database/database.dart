import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

// Reference to create tables

// ()() ; Builder pattern to generate database tables

// class TodoItems extends Table {
//   IntColumn get id => integer().autoIncrement()();
//   TextColumn get title => text().withLength(min: 6, max: 32)();
//   TextColumn get content => text().named('body')();
//   DateTimeColumn get createdAt => dateTime().nullable()();
// }

class FavoriteMovies extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get movieId => integer().named('movie_id')();
  TextColumn get backdropPath => text().named('backdrop_path')();
  TextColumn get posterPath => text().named('poster_path')();
  TextColumn get originalTitle => text().named('original_title')();
  TextColumn get title => text()();
  RealColumn get voteAverage => real()
      .named('vote_average')
      .withDefault(const Constant(0.0))(); // Optional value
  RealColumn get popularity =>
      real().withDefault(const Constant(0.0))(); // Optional value
}

@DriftDatabase(tables: [FavoriteMovies])
class AppDatabase extends _$AppDatabase {
  // After generating code, this class needs to define a `schemaVersion` getter
  // and a constructor telling drift where the database should be stored.
  // These are described in the getting started guide: https://drift.simonbinder.eu/setup/
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'my_database',
      native: const DriftNativeOptions(
        // By default, `driftDatabase` from `package:drift_flutter` stores the
        // database files in `getApplicationDocumentsDirectory()`.
        databaseDirectory: getApplicationSupportDirectory,
      ),
      // If you need web support, see https://drift.simonbinder.eu/platforms/web/
    );
  }
}

// Creation of the database instance (Object)
final database = AppDatabase();
