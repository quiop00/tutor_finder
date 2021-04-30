// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterBody _$RegisterBodyFromJson(Map<String, dynamic> json) {
  return RegisterBody()
    ..username = json['username'] as String
    ..email = json['email'] as String
    ..phoneNumber = json['phonenumber'] as String
    ..password = json['password'] as String
    ..role = (json['role'] as List)?.map((e) => e as String)?.toList();
}

Map<String, dynamic> _$RegisterBodyToJson(RegisterBody instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'phonenumber': instance.phoneNumber,
      'password': instance.password,
      'role': instance.role,
    };
