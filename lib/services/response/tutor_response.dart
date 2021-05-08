import 'package:json_annotation/json_annotation.dart';
import 'package:tutor_finder_app/models/comments_model.dart';
import 'package:tutor_finder_app/models/grade_model.dart';
import 'package:tutor_finder_app/models/schedule_model.dart';
import 'package:tutor_finder_app/models/subject_model.dart';
import 'package:tutor_finder_app/settings.dart' as settings;
part 'tutor_response.g.dart';

@JsonSerializable()
class TutorResponse {
  int id;
  String name;
  String phoneNumber;
  String avatar;
  String qualification;
  List<String> subjects;
  String address;
  List<Grade> grades;
  String rating;
  Map<String, bool> schedule;
  List<CommentModel> comments;
  String description;
  TutorResponse();
  factory TutorResponse.fromJson(Map<String, dynamic> json) =>
      _$TutorResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TutorResponseToJson(this);
  getAvatar() {
    return settings.BASE_API_URL + '/downloadFile/' + avatar ?? '';
  }

  void covertScheduleToJson(List<Schedule> schedules) {
    schedule = {};
    schedule['sang_2'] = schedules[0].morning;
    schedule['chieu_2'] = schedules[0].afternoon;
    schedule['toi_2'] = schedules[0].night;
    schedule['sang_3'] = schedules[1].morning;
    schedule['chieu_3'] = schedules[1].afternoon;
    schedule['toi_3'] = schedules[1].night;
    schedule['sang_4'] = schedules[2].morning;
    schedule['chieu_4'] = schedules[2].afternoon;
    schedule['toi_4'] = schedules[2].night;
    schedule['sang_5'] = schedules[3].morning;
    schedule['chieu_5'] = schedules[3].afternoon;
    schedule['toi_5'] = schedules[3].night;
    schedule['sang_6'] = schedules[4].morning;
    schedule['chieu_6'] = schedules[4].afternoon;
    schedule['toi_6'] = schedules[4].night;
    schedule['sang_7'] = schedules[5].morning;
    schedule['chieu_7'] = schedules[5].afternoon;
    schedule['toi_7'] = schedules[5].night;
    schedule['sang_CN'] = schedules[6].morning;
    schedule['chieu_CN'] = schedules[6].afternoon;
    schedule['toi_CN'] = schedules[6].night;
  }

  List<Schedule> schedulesFromJson(Map<String, bool> schedule) {
    List<Schedule> schedules = [];
    schedules.add(Schedule(
        name: "Thứ 2",
        morning: schedule['sang_2'] ?? false,
        afternoon: schedule['chieu_2'] ?? false,
        night: schedule['toi_2'] ?? false));
    schedules.add(Schedule(
        name: "Thứ 3",
        morning: schedule['sang_3'] ?? false,
        afternoon: schedule['chieu_3'] ?? false,
        night: schedule['toi_3'] ?? false));
    schedules.add(Schedule(
        name: "Thứ 4",
        morning: schedule['sang_4'] ?? false,
        afternoon: schedule['chieu_4'] ?? false,
        night: schedule['toi_4'] ?? false));
    schedules.add(Schedule(
        name: "Thứ 5",
        morning: schedule['sang_5'] ?? false,
        afternoon: schedule['chieu_5'] ?? false,
        night: schedule['toi_5'] ?? false));
    schedules.add(Schedule(
        name: "Thứ 6",
        morning: schedule['sang_6'] ?? false,
        afternoon: schedule['chieu_6'] ?? false,
        night: schedule['toi_6'] ?? false));
    schedules.add(Schedule(
        name: "Thứ 7",
        morning: schedule['sang_7'] ?? false,
        afternoon: schedule['chieu_7'] ?? false,
        night: schedule['toi_7'] ?? false));
    schedules.add(Schedule(
        name: "CN",
        morning: schedule['sang_CN'] ?? false,
        afternoon: schedule['chieu_CN'] ?? false,
        night: schedule['toi_CN'] ?? false));
    return schedules;
  }
}
