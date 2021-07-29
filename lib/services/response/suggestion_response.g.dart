// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggestion_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuggestionResponse _$SuggestionResponseFromJson(Map<String, dynamic> json) {
  return SuggestionResponse()
    ..suggestionId = json['id'] as int
    ..idStudent = json['idStudent'] as int
    ..idTutor = json['idTutor'] as int
    ..idPost = json['idPost'] as int
    ..status = json['status'] as int
    ..nameTutor = json['nameTutor'] as String
    ..avatar = json['avatar'] as String
    ..titlePost = json['titlePost'] as String;
}

Map<String, dynamic> _$SuggestionResponseToJson(SuggestionResponse instance) =>
    <String, dynamic>{
      'id': instance.suggestionId,
      'idStudent': instance.idStudent,
      'idTutor': instance.idTutor,
      'idPost': instance.idPost,
      'status': instance.status,
      'nameTutor': instance.nameTutor,
      'avatar': instance.avatar,
      'titlePost': instance.titlePost,
    };
