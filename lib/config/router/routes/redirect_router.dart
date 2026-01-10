import 'package:go_router/go_router.dart';

class RedirectRouter {
  static final routePath = '/home/1';
  static final route = GoRoute(path: '/', redirect: (_, _) => routePath);
}
