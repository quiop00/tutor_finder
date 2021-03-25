// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeModel _$TimeModelFromJson(Map<String, dynamic> json) {
  return TimeModel()
    ..startingTime = json['startingTime'] as String
    ..endTime = json['endTime'] as String
    ..status = json['status'] as bool;
}

Map<String, dynamic> _$TimeModelToJson(TimeModel instance) => <String, dynamic>{
      'startingTime': instance.startingTime,
      'endTime': instance.endTime,
      'status': instance.status,
    };
