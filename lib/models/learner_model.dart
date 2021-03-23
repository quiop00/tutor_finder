import 'package:json_annotation/json_annotation.dart';
import 'package:tutor_finder_app/models/grade_model.dart';
import 'package:tutor_finder_app/models/user_model.dart';
part 'learner_model.g.dart';
@JsonSerializable()
class Learner extends User{
  String phoneNumber;
  Learner();
  factory Learner.fromJson(Map<String,dynamic>json)=>
      _$LearnerFromJson(json);
  Map<String,dynamic> toJson()=>_$LearnerToJson(this);
}