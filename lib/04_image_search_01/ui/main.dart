import 'package:flutter/material.dart';
import 'package:flutter_beginner/04_image_search_01/ui/main/main_screen.dart';
import 'package:flutter_beginner/04_image_search_01/ui/main/main_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => MainViewModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.deepPurple, // Set the primary color swatch
          ),
        ),
        home: MainScreen(),
      ),
    );
  }
}
