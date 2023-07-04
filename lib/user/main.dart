import 'package:flutter/material.dart';
import 'package:flutter_beginner/user/data/ui/user/user_sceen/user_view_model.dart';
import 'package:provider/provider.dart';

import 'data/ui/user/user_sceen/user_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => UserViewModel(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserScreen(),
    );
  }
}
