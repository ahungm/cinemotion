import 'package:cinemotion/config/router/routes/home_router.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  // Main Configuration
  initialLocation: '/home/1',
  routes: [HomeRouter.route],
);
