import '../dto/UserResultDto.dart';
import '../model/user.dart';

extension ToUser on UserResultDto {
  User toUser() {
    return User(
        id: id ?? 0,
        name: name ?? '',
        email: email ?? '',
        address: address ?? Address(),
        phone: phone ?? '',
        website: website ?? '',
        company: company ?? Company());
  }
}
