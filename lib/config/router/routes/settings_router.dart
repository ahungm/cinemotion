import 'package:cinemotion/presentation/views/shared/appearance/appearance_mode_tile.dart';
import 'package:go_router/go_router.dart';

class SettingsRouter {
  static final routePath = 'settings';
  static final route = GoRoute(
    name: AppearanceModeTile.name,
    path: routePath, // Sub-route
    builder: (context, state) => const AppearanceModeTile(),
  );
}
