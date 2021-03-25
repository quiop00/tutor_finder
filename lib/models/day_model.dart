import 'package:json_annotation/json_annotation.dart';
import 'package:tutor_finder_app/models/time_model.dart';
class DayScheduleTutor{
  String teachingDay;
  List<TimeModel> times;
  DayScheduleTutor();
  factory DayScheduleTutor.fromJson(Map<String,dynamic> json)=>
      DayScheduleTutor()
        ..teachingDay=json['teachingDay'] as String
        ..times= (json['times'] as List)
          ?.map((e) => e==null?null:TimeModel.fromJson(e as Map<String,dynamic>));
   Map<String,dynamic> toJson()=>
      <String,dynamic>{
        'teachingDay':this.teachingDay,
        'times':this.times
      };

}