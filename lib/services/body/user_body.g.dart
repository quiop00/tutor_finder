// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserBody _$UserBodyFromJson(Map<String, dynamic> json) {
  return UserBody()
    ..id = json['id'] as int
    ..userName = json['username'] as String
    ..password = json['password'] as String
    ..email = json['email'] as String
    ..phoneNumber = json['phonenumber'] as String
    ..age = json['age'] as int
    ..name = json['name'] as String
    ..gender = json['gender'] as bool;
}

Map<String, dynamic> _$UserBodyToJson(UserBody instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.userName,
      'password': instance.password,
      'email': instance.email,
      'phonenumber': instance.phoneNumber,
      'age': instance.age,
      'name': instance.name,
      'gender': instance.gender,
    };
