import 'package:cinemotion/config/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeNotifier extends Notifier<AppTheme> {
  @override
  AppTheme build() => AppTheme();

  // Side Effect Methods
  void toggleDarkMode() =>
      state = state.copyWith(isDarkModeEnabled: !state.isDarkModeEnabled);
}

// Custom object of the App Theme class
final themeNotifierProvider = NotifierProvider<ThemeNotifier, AppTheme>(
  ThemeNotifier.new,
);
