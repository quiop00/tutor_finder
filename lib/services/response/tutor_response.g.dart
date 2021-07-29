// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TutorResponse _$TutorResponseFromJson(Map<String, dynamic> json) {
  return TutorResponse()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..phoneNumber = json['phonenumber'] as String
    ..avatar = json['avatar'] as String
    ..qualification = json['qualification'] as String
    ..subject = (json['subject'] as List)?.map((e) => e as String)?.toList()
    ..address = json['address'] as String
    ..grade = (json['grade'] as List)?.map((e) => e as String)?.toList()
    ..rating = json['rating'] as String
    ..schedules = (json['schedules'] as Map<String, dynamic>)?.map(
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
      'phonenumber': instance.phoneNumber,
      'avatar': instance.avatar,
      'qualification': instance.qualification,
      'subject': instance.subject,
      'address': instance.address,
      'grade': instance.grade,
      'rating': instance.rating,
      'schedules': instance.schedules,
      'comments': instance.comments,
      'description': instance.description,
    };
