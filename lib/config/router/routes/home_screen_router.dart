import 'package:cinemotion/config/router/routes/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:cinemotion/presentation/screens/screens.dart';

RouteBase homeScreenRouter = GoRoute(
  path: '/',
  name: HomeScreen.name,
  builder: (context, state) => const HomeScreen(),
  routes: [movieScreenRouter],
);
