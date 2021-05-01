// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Learner _$LearnerFromJson(Map<String, dynamic> json) {
  return Learner()
    ..id = json['id'] as int
    ..userName = json['userName'] as String
    ..password = json['password'] as String
    ..email = json['email'] as String
    ..phoneNumber = json['phoneNumber'] as String;
}

Map<String, dynamic> _$LearnerToJson(Learner instance) => <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'password': instance.password,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
    };
