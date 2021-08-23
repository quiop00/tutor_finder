// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) {
  return CommentModel()
    ..id = json['id'] as int
    ..idStudent = json['idStudent'] as int
    ..nameStudent = json['nameStudent'] as String
    ..idTutor = json['idTutor'] as int
    ..content = json['content'] as String;
}

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idStudent': instance.idStudent,
      'nameStudent': instance.nameStudent,
      'idTutor': instance.idTutor,
      'content': instance.content,
    };
