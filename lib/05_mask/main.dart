import 'package:flutter/material.dart';
import 'package:flutter_beginner/05_mask/ui/store/store_view_model.dart';
import 'package:provider/provider.dart';
import 'ui/store/store_sceen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) {
        return StoreViewModel();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StoreSceen(),
    );
  }
}
