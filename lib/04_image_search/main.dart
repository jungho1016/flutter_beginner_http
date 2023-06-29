import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screen/image_search_screen.dart';
import 'view_model/image_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ImageViewModel(),
      child: MaterialApp(
        home: ImageSearchScreen(),
      ),
    );
  }
}
