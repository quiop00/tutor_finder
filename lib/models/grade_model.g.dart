// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grade_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Grade _$GradeFromJson(Map<String, dynamic> json) {
  return Grade()
    ..gradeId = json['gradeId'] as String
    ..nameGrade = json['nameGrade'] as String;
}

Map<String, dynamic> _$GradeToJson(Grade instance) => <String, dynamic>{
      'gradeId': instance.gradeId,
      'nameGrade': instance.nameGrade,
    };
