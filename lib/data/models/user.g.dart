// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['username'] as String,
    json['password'] as String,
    json['fullName'] as String,
    json['roleId'] as int,
    json['storeId'] as int,
    json['status'] as bool,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'fullName': instance.fullName,
      'roleId': instance.roleId,
      'storeId': instance.storeId,
      'status': instance.status,
    };
