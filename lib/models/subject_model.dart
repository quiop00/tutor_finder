import 'package:json_annotation/json_annotation.dart';
part 'subject_model.g.dart';
@JsonSerializable()
class Subject{
  String id;
  String subjectName;
  Subject();
  factory Subject.fromJson(Map<String,dynamic> json){
    return _$SubjectFromJson(json);
  }
  Map<String,dynamic> toJson()=>_$SubjectToJson(this);
}