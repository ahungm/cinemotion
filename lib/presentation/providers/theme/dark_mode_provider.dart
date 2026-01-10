import 'package:flutter_riverpod/flutter_riverpod.dart';

class DarkMode extends Notifier<bool> {
  @override
  bool build() => false;

  // Side Effect Methods
  bool enableDarkMode() => state = !state;
}

// Provider
final darkModeProvider = NotifierProvider<DarkMode, bool>(DarkMode.new);
