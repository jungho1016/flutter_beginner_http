import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'user_view_model.dart';

class UserScreen extends StatefulWidget {
  UserScreen({Key? key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final UserViewModel _userViewModel = UserViewModel();

  @override
  void initState() {
    super.initState();
    _userViewModel.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<UserViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text('User'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _userViewModel.users.length,
        itemBuilder: (context, index) {
          final user = _userViewModel.users[index];
          return ListTile(
            title: Text(user.name),
            subtitle: Text('${user.email}'),
            trailing: Text(user.company.name!),
          );
        },
      ),
    );
  }
}
