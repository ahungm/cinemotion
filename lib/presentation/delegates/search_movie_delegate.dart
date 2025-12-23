import 'package:flutter/material.dart';

// A delegate is used to an object or function used to separate responsibilities,
// allowing one object to handle specific tasks, events, or layout logic on behalf
// of another, more complex object. This promotes cleaner, more modular, and reusable
// code, especially when building UI interfaces

class SearchMovieDelegate extends SearchDelegate {
  @override
  String get searchFieldLabel => 'Buscar película';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [const Text('This is buildActions')];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Text('This is buildLeading');
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('This is buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text('This is buildSuggestions');
  }
}
