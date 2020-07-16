import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'role.g.dart';

@JsonSerializable(nullable: false)
class Role {
  final int roleId;
  final String roleName;

  Role(this.roleId, this.roleName);

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);

  Map<String, dynamic> toJson() => _$RoleToJson(this);
}
