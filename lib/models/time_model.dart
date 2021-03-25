import 'package:json_annotation/json_annotation.dart';
part 'time_model.g.dart';
@JsonSerializable()
class TimeModel{
  String startingTime;
  String endTime;
  bool status;
  TimeModel();
  factory TimeModel.fromJson(Map<String,dynamic> json)=>
      _$TimeModelFromJson(json);
  Map<String,dynamic> toJson()=>
      _$TimeModelToJson(this);
}