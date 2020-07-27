import 'dart:core';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(nullable: false)
class User {
  final String username;
  final String password;
  final String fullName;
  final int roleId;
  final int storeId;
  final bool status;

  User(this.username, this.password, this.fullName, this.roleId, this.storeId,
      this.status);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
