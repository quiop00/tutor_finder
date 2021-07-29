// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClassResponse _$ClassResponseFromJson(Map<String, dynamic> json) {
  return ClassResponse()
    ..idStudent = json['idStudent'] as int
    ..idPost = json['idPost'] as int
    ..nameStudent = json['nameStudent'] as String
    ..titlePost = json['titlePost'] as String;
}

Map<String, dynamic> _$ClassResponseToJson(ClassResponse instance) =>
    <String, dynamic>{
      'idStudent': instance.idStudent,
      'idPost': instance.idPost,
      'nameStudent': instance.nameStudent,
      'titlePost': instance.titlePost,
    };
