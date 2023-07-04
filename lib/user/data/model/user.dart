import 'package:flutter_beginner/user/data/dto/UserResultDto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
class User with _$User {
  const factory User(
      {required num id,
      required String name,
      required String email,
      required Address address,
      required String phone,
      required String website,
      required Company company}) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
