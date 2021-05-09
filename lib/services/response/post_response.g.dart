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
    ..subjects = (json['subjects'] as List)?.map((e) => e as String)?.toList()
    ..price = json['price'] as String
    ..phoneNumber = json['phoneNumber'] as String
    ..address = json['address'] as String
    ..description = json['description'] as String
    ..schedule = (json['schedule'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as bool),
    );
}

Map<String, dynamic> _$PostResponseToJson(PostResponse instance) =>
    <String, dynamic>{
      'id': instance.postId,
      'idStudent': instance.idStudent,
      'grade': instance.grade,
      'title': instance.title,
      'subjects': instance.subjects,
      'price': instance.price,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'description': instance.description,
      'schedule': instance.schedule,
    };
