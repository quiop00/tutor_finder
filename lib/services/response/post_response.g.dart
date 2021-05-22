// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostResponse _$PostResponseFromJson(Map<String, dynamic> json) {
  return PostResponse()
    ..postId = json['id'] as int
    ..idStudent = json['idStudent'] as int
    ..grade = json['grade'] as String
    ..title = json['title'] as String
    ..subjects = (json['subject'] as List)?.map((e) => e as String)?.toList()
    ..price = json['price'] as String
    ..phoneNumber = json['phonenumber'] as String
    ..address = json['address'] as String
    ..description = json['description'] as String
    ..schedules = (json['schedules'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as bool),
    );
}

Map<String, dynamic> _$PostResponseToJson(PostResponse instance) =>
    <String, dynamic>{
      'id': instance.postId,
      'idStudent': instance.idStudent,
      'grade': instance.grade,
      'title': instance.title,
      'subject': instance.subjects,
      'price': instance.price,
      'phonenumber': instance.phoneNumber,
      'address': instance.address,
      'description': instance.description,
      'schedules': instance.schedules,
    };
