// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Role _$RoleFromJson(Map<String, dynamic> json) {
  return Role(
    json['roleId'] as int,
    json['roleName'] as String,
  );
}

Map<String, dynamic> _$RoleToJson(Role instance) => <String, dynamic>{
      'roleId': instance.roleId,
      'roleName': instance.roleName,
    };
