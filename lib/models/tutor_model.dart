import 'package:json_annotation/json_annotation.dart';
import 'package:tutor_finder_app/models/comments_model.dart';
import 'package:tutor_finder_app/models/grade_model.dart';
import 'package:tutor_finder_app/models/subject_model.dart';
import 'package:tutor_finder_app/models/user_model.dart';
import 'package:tutor_finder_app/ui/widget/schedule.dart';
import 'package:tutor_finder_app/settings.dart' as settings;
import 'day_model.dart';
part 'tutor_model.g.dart';

@JsonSerializable()
class Tutor extends User {
  String name;
  String avatar;
  String qualification;
  List<String> subjects;
  String address;
  List<String> grades;
  String rating;
  Map<String, bool> schedule;
  List<CommentModel> comments;
  String description;
  Tutor();
  factory Tutor.fromJson(Map<String, dynamic> json) => _$TutorFromJson(json);
  Map<String, dynamic> toJson() => _$TutorToJson(this);
  getAvatar() {
    return settings.BASE_API_URL + '/downloadFile/' + avatar ?? '';
  }
}
