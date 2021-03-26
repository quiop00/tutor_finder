// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) {
  return CommentModel()
    ..user = json['user'] as String
    ..content = json['content'] as String
    ..timeStamp = json['timeStamp'] as String;
}

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'content': instance.content,
      'timeStamp': instance.timeStamp,
    };
