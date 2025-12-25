import 'package:flutter_riverpod/flutter_riverpod.dart';

class QueryNotifier extends Notifier<String> {
  @override
  String build() {
    return '';
  }

  // Side Effect Methods
  void refreshQuery(String query) => state = query;
}

final searchQueryProvider = NotifierProvider<QueryNotifier, String>(
  QueryNotifier.new,
);
