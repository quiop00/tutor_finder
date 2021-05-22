import 'package:json_annotation/json_annotation.dart';
import 'package:tutor_finder_app/models/grade_model.dart';
import 'package:tutor_finder_app/models/learner_model.dart';
import 'package:tutor_finder_app/models/schedule_model.dart';
part 'post_response.g.dart';

@JsonSerializable()
class PostResponse {
  @JsonKey(name: 'id')
  int postId;
  int idStudent;
  String grade;
  String title;
  @JsonKey(name: 'subject')
  List<String> subjects;
  String price;
  @JsonKey(name: 'phonenumber')
  String phoneNumber;
  String address;
  String description;
  Map<String, bool> schedules;
  PostResponse();
  factory PostResponse.fromJson(Map<String, dynamic> json) =>
      _$PostResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PostResponseToJson(this);
}
