// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tutor _$TutorFromJson(Map<String, dynamic> json) {
  return Tutor()
    ..id = json['id'] as int
    ..userName = json['userName'] as String
    ..password = json['password'] as String
    ..email = json['email'] as String
    ..phoneNumber = json['phoneNumber'] as String
    ..age = json['age'] as int
    ..gender = json['gender'] as int
    ..name = json['name'] as String
    ..avatar = json['avatar'] as String
    ..qualification = json['qualification'] as String
    ..subject = (json['subject'] as List)?.map((e) => e as String)?.toList()
    ..address = json['address'] as String
    ..grade = (json['grade'] as List)?.map((e) => e as String)?.toList()
    ..rating = json['rating'] as String
    ..schedules = (json['schedules'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as bool),
    )
    ..comments = (json['comments'] as List)
        ?.map((e) =>
            e == null ? null : CommentModel.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..description = json['description'] as String;
}

Map<String, dynamic> _$TutorToJson(Tutor instance) => <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'password': instance.password,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'age': instance.age,
      'gender': instance.gender,
      'name': instance.name,
      'avatar': instance.avatar,
      'qualification': instance.qualification,
      'subject': instance.subject,
      'address': instance.address,
      'grade': instance.grade,
      'rating': instance.rating,
      'schedules': instance.schedules,
      'comments': instance.comments,
      'description': instance.description,
    };
