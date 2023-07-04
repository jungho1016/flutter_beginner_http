import 'package:flutter_beginner/bmi/main/main_screen.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/main',
      builder: (context, state) => MainScreen(),
    ),
    GoRoute(
      path: '/detail',
      builder: (context, state) => MainScreen(),
    ),
  ],
);
