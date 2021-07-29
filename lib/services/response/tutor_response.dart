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
  @JsonKey(name: 'phonenumber')
  String phoneNumber;
  String avatar;
  String qualification;
  List<String> subject;
  String address;
  List<String> grade;
  String rating;
  Map<String, bool> schedules;
  List<CommentModel> comments;
  String description;
  TutorResponse();
  factory TutorResponse.fromJson(Map<String, dynamic> json) =>
      _$TutorResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TutorResponseToJson(this);
  getAvatar() {
    return settings.BASE_API_URL + '/downloadFile/' + avatar ?? '';
  }
}
