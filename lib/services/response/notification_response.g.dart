// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationResponse _$NotificationResponseFromJson(Map<String, dynamic> json) {
  return NotificationResponse()
    ..notifies = (json['notifies'] as List)
        ?.map((e) => e == null
            ? null
            : NotificationModel.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$NotificationResponseToJson(
        NotificationResponse instance) =>
    <String, dynamic>{
      'notifies': instance.notifies,
    };
