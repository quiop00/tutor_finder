// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post()
    ..postId = json['postId'] as int
    ..title = json['title'] as String
    ..price = json['price'] as String
    ..description = json['description'] as String
    ..learner = json['learner'] == null
        ? null
        : Learner.fromJson(json['learner'] as Map<String, dynamic>)
    ..grades = (json['grades'] as List)
        ?.map(
            (e) => e == null ? null : Grade.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'postId': instance.postId,
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'learner': instance.learner,
      'grades': instance.grades,
    };
