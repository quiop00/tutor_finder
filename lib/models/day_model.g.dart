// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DayScheduleTutor _$DayScheduleTutorFromJson(Map<String, dynamic> json) {
  return DayScheduleTutor()
    ..teachingDay = json['teachingDay'] as String
    ..times = (json['times'] as List)
        ?.map((e) =>
            e == null ? null : TimeModel.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$DayScheduleTutorToJson(DayScheduleTutor instance) =>
    <String, dynamic>{
      'teachingDay': instance.teachingDay,
      'times': instance.times,
    };
