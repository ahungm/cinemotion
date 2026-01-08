import 'package:cinemotion/presentation/views/shared/settings.dart';
import 'package:cinemotion/presentation/views/shared/settings_view.dart';
import 'package:go_router/go_router.dart';

class SettingsRouter {
  static final route = GoRoute(
    path: 'settings', // This is /home/:page/settings
    // Settings Wrapper screen
    builder: (context, state) => const SettingsView(),
    routes: _settingsRoutes,
  );
}

List<RouteBase> _settingsRoutes = [
  GoRoute(
    name: AppearanceModeTile.name,
    path: 'appearance', // This is /home/:page/settings/appearance
    builder: (context, state) => const AppearanceModeTile(),
  ),
  GoRoute(
    name: LanguageTile.name,
    path: 'language', // This is /home/:page/settings/language
    builder: (context, state) => const LanguageTile(),
  ),
];
