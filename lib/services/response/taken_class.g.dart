// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taken_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TakenClass _$TakenClassFromJson(Map<String, dynamic> json) {
  return TakenClass()
    ..takenClass = (json['class'] as List)
        ?.map((e) => e == null
            ? null
            : ClassResponse.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$TakenClassToJson(TakenClass instance) =>
    <String, dynamic>{
      'class': instance.takenClass,
    };
