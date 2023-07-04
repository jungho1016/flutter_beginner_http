import 'dart:convert';

import 'package:http/http.dart' as http;

import '../dto/UserResultDto.dart';

class UserApi {
  final url = 'https://jsonplaceholder.typicode.com/users';

  Future<List<UserResultDto>> getUsers() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode != 200) {
      return [];
    }

    final List<dynamic> jsonString = jsonDecode(response.body);
    return jsonString.map((e) => UserResultDto.fromJson(e)).toList();
  }
}
