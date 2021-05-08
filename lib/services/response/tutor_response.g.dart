// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TutorResponse _$TutorResponseFromJson(Map<String, dynamic> json) {
  return TutorResponse()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..phoneNumber = json['phoneNumber'] as String
    ..avatar = json['avatar'] as String
    ..qualification = json['qualification'] as String
    ..subjects = (json['subjects'] as List)?.map((e) => e as String)?.toList()
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

Map<String, dynamic> _$TutorResponseToJson(TutorResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
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
