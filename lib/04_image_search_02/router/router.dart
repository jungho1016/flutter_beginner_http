import 'package:flutter/material.dart';
import 'package:flutter_beginner/04_image_search_02/data/model/photo.dart';
import 'package:flutter_beginner/04_image_search_02/data/repository/pixabay_repositoryImpl.dart';
import 'package:flutter_beginner/04_image_search_02/ui/main/main_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../ui/detail/detail_screen.dart';
import '../ui/main/main_sceen.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/main',
  routes: [
    GoRoute(
      path: '/main',
      builder: (context, state) => ChangeNotifierProvider(
          create: (BuildContext context) {
            return MainViewModel(PixabayPhotoRepositoryImpl());
          },
          child: MainScreen()),
    ),
    GoRoute(
        path: '/detail',
        builder: (context, state) {
          final photo = state.extra as Photo;
          return DetailScreen(photo: photo);
        }),
  ],
);
