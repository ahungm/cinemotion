import 'package:cinemotion/config/helpers/custom_scroll_behavior.dart';
import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'package:cinemotion/config/router/app_router.dart';
import 'package:cinemotion/config/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  _buildDatabaseConnection();
  await dotenv.load(fileName: '.env');
  // usePathUrlStrategy();
  runApp(
    // Riverpod Implementation
    const ProviderScope(child: MainApp()),
  );
}

void _buildDatabaseConnection() async {
  WidgetsFlutterBinding.ensureInitialized();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const _AppView();
  }
}

class _AppView extends StatelessWidget {
  const _AppView();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scrollBehavior: CustomScrollBehavior(),
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}
