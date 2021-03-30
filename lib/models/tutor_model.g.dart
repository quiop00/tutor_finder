// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tutor _$TutorFromJson(Map<String, dynamic> json) {
  return Tutor()
    ..id = json['id'] as String
    ..userName = json['userName'] as String
    ..password = json['password'] as String
    ..gender = json['gender'] as String
    ..email = json['email'] as String
    ..address = json['address'] as String
    ..phoneNumber = json['phoneNumber'] as String
    ..avatar = json['avatar'] as String
    ..AuthorityId = json['AuthorityId'] as String
    ..name = json['name'] as String
    ..avatarPath = json['avatarPath'] as String
    ..subjects = (json['subjects'] as List)
        ?.map((e) =>
            e == null ? null : Subject.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..location = json['location'] as String
    ..grades = (json['grades'] as List)
        ?.map(
            (e) => e == null ? null : Grade.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..rating = json['rating'] as String
    ..schedule = (json['schedule'] as List)
        ?.map((e) => e == null
            ? null
            : DayScheduleTutor.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..comments = (json['comments'] as List)
        ?.map((e) =>
            e == null ? null : CommentModel.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..description = json['description'] as String;
}

Map<String, dynamic> _$TutorToJson(Tutor instance) => <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'password': instance.password,
      'gender': instance.gender,
      'email': instance.email,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'avatar': instance.avatar,
      'AuthorityId': instance.AuthorityId,
      'name': instance.name,
      'avatarPath': instance.avatarPath,
      'subjects': instance.subjects,
      'location': instance.location,
      'grades': instance.grades,
      'rating': instance.rating,
      'schedule': instance.schedule,
      'comments': instance.comments,
      'description': instance.description,
    };
