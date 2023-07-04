import 'package:flutter/material.dart';
import 'package:flutter_beginner/user/data/repository/user_repositoryimpl.dart';

import '../../../model/user.dart';

class UserViewModel extends ChangeNotifier {
  UserRepositoryImple userRepositoryImple = UserRepositoryImple();
  List<User> users = [];

  Future<void> getUsers() async {
    try {
      users = await userRepositoryImple.getUsers();
      notifyListeners();
    } catch (error) {
      // Handle error here
    }
  }
}
