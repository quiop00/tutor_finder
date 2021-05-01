// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grade_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Grade _$GradeFromJson(Map<String, dynamic> json) {
  return Grade()
    ..gradeId = json['id'] as int
    ..nameGrade = json['gradename'] as String;
}

Map<String, dynamic> _$GradeToJson(Grade instance) => <String, dynamic>{
      'id': instance.gradeId,
      'gradename': instance.nameGrade,
    };
