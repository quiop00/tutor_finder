// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Learner _$LearnerFromJson(Map<String, dynamic> json) {
  return Learner()
    ..id = json['id'] as String
    ..userName = json['userName'] as String
    ..password = json['password'] as String
    ..gender = json['gender'] as String
    ..email = json['email'] as String
    ..address = json['address'] as String
    ..avatar = json['avatar'] as String
    ..AuthorityId = json['AuthorityId'] as String
    ..phoneNumber = json['phoneNumber'] as String;
}

Map<String, dynamic> _$LearnerToJson(Learner instance) => <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'password': instance.password,
      'gender': instance.gender,
      'email': instance.email,
      'address': instance.address,
      'avatar': instance.avatar,
      'AuthorityId': instance.AuthorityId,
      'phoneNumber': instance.phoneNumber,
    };
