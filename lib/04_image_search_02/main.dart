import 'package:flutter/material.dart';
import 'package:flutter_beginner/04_image_search_02/router/router.dart';
import 'package:flutter_beginner/04_image_search_02/ui/main/main_sceen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
