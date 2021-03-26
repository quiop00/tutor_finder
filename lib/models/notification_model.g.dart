// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) {
  return NotificationModel()
    ..title = json['title'] as String
    ..content = json['content'] as String
    ..readingStatus = json['readingStatus'] as bool;
}

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'readingStatus': instance.readingStatus,
    };
