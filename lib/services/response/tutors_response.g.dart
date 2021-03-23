// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutors_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TutorsResponse _$TutorsResponseFromJson(Map<String, dynamic> json) {
  return TutorsResponse()
    ..tutors = (json['tutors'] as List)
        ?.map(
            (e) => e == null ? null : Tutor.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$TutorsResponseToJson(TutorsResponse instance) =>
    <String, dynamic>{
      'tutors': instance.tutors,
    };
