import 'package:json_annotation/json_annotation.dart';
import 'package:tutor_finder_app/models/time_model.dart';
part 'day_model.g.dart';
@JsonSerializable()
class DayScheduleTutor{
  String teachingDay;
  List<TimeModel> times;
  DayScheduleTutor();
  factory DayScheduleTutor.fromJson(Map<String,dynamic> json)=>
      _$DayScheduleTutorFromJson(json);
   Map<String,dynamic> toJson()=>
      _$DayScheduleTutorToJson(this);

}