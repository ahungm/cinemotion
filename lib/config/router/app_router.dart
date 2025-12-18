import 'package:cinemotion/config/router/routes/home_screen_router.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  // Main Configuration
  initialLocation: '/',
  routes: [homeScreenRouter],
);
