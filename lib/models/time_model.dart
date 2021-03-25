import 'package:json_annotation/json_annotation.dart';

class TimeModel{
  String startingTime;
  int minute;
  TimeModel();
  factory TimeModel.fromJson(Map<String,dynamic> json)=>
      TimeModel()
        ..startingTime=json['startingTime'] as String
        ..minute=json['minute'] as int;
  Map<String,dynamic> toJson()=>
      <String,dynamic>{
         'startingTime':this.startingTime,
         'minute':this.minute
      };
}