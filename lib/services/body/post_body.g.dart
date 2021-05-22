// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostBody _$PostBodyFromJson(Map<String, dynamic> json) {
  return PostBody()
    ..title = json['title'] as String
    ..subject = (json['subject'] as List)?.map((e) => e as String)?.toList()
    ..grade = json['grade'] as String
    ..price = json['price'] as String
    ..address = json['address'] as String
    ..phoneNumber = json['phonenumber'] as String
    ..description = json['description'] as String
    ..schedule = (json['schedules'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as bool),
    );
}

Map<String, dynamic> _$PostBodyToJson(PostBody instance) => <String, dynamic>{
      'title': instance.title,
      'subject': instance.subject,
      'grade': instance.grade,
      'price': instance.price,
      'address': instance.address,
      'phonenumber': instance.phoneNumber,
      'description': instance.description,
      'schedules': instance.schedule,
    };
