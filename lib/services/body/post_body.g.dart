// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostBody _$PostBodyFromJson(Map<String, dynamic> json) {
  return PostBody()
    ..title = json['title'] as String
    ..subject = json['subject'] as String
    ..topic = json['topic'] as String
    ..price = json['price'] as String
    ..address = json['address'] as String
    ..description = json['description'] as String
    ..schedule = (json['schedule'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as bool),
    );
}

Map<String, dynamic> _$PostBodyToJson(PostBody instance) => <String, dynamic>{
      'title': instance.title,
      'subject': instance.subject,
      'topic': instance.topic,
      'price': instance.price,
      'address': instance.address,
      'description': instance.description,
      'schedule': instance.schedule,
    };
