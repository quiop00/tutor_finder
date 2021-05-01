import 'package:json_annotation/json_annotation.dart';
import 'package:tutor_finder_app/models/day_model.dart';

class Schedule {
  String name;
  bool morning;
  bool afternoon;
  bool night;
  Schedule({this.name, this.morning, this.afternoon, this.night});
  static initSchedules() {
    List<Schedule> schedules = [];
    schedules.add(Schedule(
        name: "Thứ 2", morning: false, afternoon: false, night: false));
    schedules.add(Schedule(
        name: "Thứ 3", morning: false, afternoon: false, night: false));
    schedules.add(Schedule(
        name: "Thứ 4", morning: false, afternoon: false, night: false));
    schedules.add(Schedule(
        name: "Thứ 5", morning: false, afternoon: false, night: false));
    schedules.add(Schedule(
        name: "Thứ 6", morning: false, afternoon: false, night: false));
    schedules.add(Schedule(
        name: "Thứ 7", morning: false, afternoon: false, night: false));
    schedules.add(
        Schedule(name: "CN", morning: false, afternoon: false, night: false));
    return schedules;
  }
}
