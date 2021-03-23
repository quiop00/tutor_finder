import 'package:json_annotation/json_annotation.dart';
import 'package:tutor_finder_app/models/grade_model.dart';
import 'package:tutor_finder_app/models/subject_model.dart';
import 'package:tutor_finder_app/models/user_model.dart';
part 'tutor_model.g.dart';
@JsonSerializable()
class Tutor extends User{
  String name;
  String avatarPath;
  List<Subject> subjects;
  String location;
  List<Grade> grades;
  String rating;
  Tutor();
  factory Tutor.fromJson(Map<String,dynamic>json)=>
      _$TutorFromJson(json);
  Map<String,dynamic> toJson()=>_$TutorToJson(this);
}