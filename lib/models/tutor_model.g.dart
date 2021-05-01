// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tutor _$TutorFromJson(Map<String, dynamic> json) {
  return Tutor()
    ..id = json['id'] as int
    ..userName = json['userName'] as String
    ..password = json['password'] as String
    ..email = json['email'] as String
    ..phoneNumber = json['phoneNumber'] as String
    ..name = json['name'] as String
    ..avatar = json['avatar'] as String
    ..qualification = json['qualification'] as String
    ..subjects = (json['subjects'] as List)
        ?.map((e) =>
            e == null ? null : Subject.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..address = json['address'] as String
    ..grades = (json['grades'] as List)
        ?.map(
            (e) => e == null ? null : Grade.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..rating = json['rating'] as String
    ..schedule = (json['schedule'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as bool),
    )
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
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'name': instance.name,
      'avatar': instance.avatar,
      'qualification': instance.qualification,
      'subjects': instance.subjects,
      'address': instance.address,
      'grades': instance.grades,
      'rating': instance.rating,
      'schedule': instance.schedule,
      'comments': instance.comments,
      'description': instance.description,
    };
