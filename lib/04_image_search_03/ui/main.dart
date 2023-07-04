import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beginner/04_image_search_01/ui/main/main_screen.dart';
import 'package:flutter_beginner/bmi/route.dart';

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
