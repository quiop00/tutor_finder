import 'package:tutor_finder_app/models/day_model.dart';

class ScheduleModel{
  List<DayScheduleTutor> schedule;
  ScheduleModel();
  factory ScheduleModel.fromJson(Map<String,dynamic> json)=>
    ScheduleModel()
      ..schedule=(json['schedule'] as List)
        ?.map((e) => e == null ? null: DayScheduleTutor.fromJson(e as Map<String,dynamic>));
  Map<String,dynamic> toJson()=>
      <String,dynamic>{
         'schedule':this.schedule
      };
}