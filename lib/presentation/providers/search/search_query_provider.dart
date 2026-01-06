import 'package:flutter_riverpod/flutter_riverpod.dart';

class QueryNotifier extends Notifier<String> {
  final String query = '';

  @override
  String build() {
    return query;
  }

  // Side Effect Methods
  void refreshQuery(String query) => state = query;
}

final searchQueryProvider = NotifierProvider<QueryNotifier, String>(
  QueryNotifier.new,
);
