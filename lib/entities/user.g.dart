// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    name: json['name'] as String,
    email: json['email'] as String,
    userName: json['userName'] as String,
    phoneNumber: json['phoneNumber'] as String,
    password: json['password'] as String,
    roleName: json['roleName'] as int,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'userName': instance.userName,
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
      'roleName': instance.roleName,
    };
