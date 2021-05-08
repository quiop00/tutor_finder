// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TutorBody _$TutorBodyFromJson(Map<String, dynamic> json) {
  return TutorBody()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..phoneNumber = json['phonenumber'] as String
    ..qualification = json['qualification'] as String
    ..subjects = (json['subjects'] as List)?.map((e) => e as String)?.toList()
    ..address = json['address'] as String
    ..grades = (json['grades'] as List)
        ?.map(
            (e) => e == null ? null : Grade.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..schedule = (json['schedule'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as bool),
    )
    ..description = json['description'] as String;
}

Map<String, dynamic> _$TutorBodyToJson(TutorBody instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phonenumber': instance.phoneNumber,
      'qualification': instance.qualification,
      'subjects': instance.subjects,
      'address': instance.address,
      'grades': instance.grades,
      'schedule': instance.schedule,
      'description': instance.description,
    };
