import 'package:flutter_beginner/user/data/api/user_api.dart';
import 'package:flutter_beginner/user/data/mapper/user_mapper.dart';
import 'package:flutter_beginner/user/data/model/user.dart';
import 'package:flutter_beginner/user/data/repository/user_repository.dart';

class UserRepositoryImple implements UserRepository {
  @override
  Future<List<User>> getUsers() async {
    final _api = UserApi();
    print(_api);
    final resultDto = await _api.getUsers();
    print(resultDto);
    return resultDto.map((e) => e.toUser()).toList();
  }
}

void main() {
  UserRepositoryImple userRepositoryImple = UserRepositoryImple();
  userRepositoryImple.getUsers();
}
