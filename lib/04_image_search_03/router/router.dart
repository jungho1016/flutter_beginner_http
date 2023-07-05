import 'package:flutter/material.dart';
import 'package:flutter_beginner/04_image_search_01/ui/main/main_view_model.dart';

import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../ui/main/main_screen.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/main',
  routes: [
    GoRoute(
      path: '/main',
      builder: (context, state) => ChangeNotifierProvider(
          create: (BuildContext context) => MainViewModel(),
          child: MainScreen1()),
    ),
    GoRoute(
      path: '/detail',
      builder: (context, state) => MainScreen1(),
    ),
  ],
);
