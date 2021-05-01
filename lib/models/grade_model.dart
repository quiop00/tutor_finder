import 'package:json_annotation/json_annotation.dart';
part 'grade_model.g.dart';
@JsonSerializable()
class Grade{
  @JsonKey(name: 'id')
  int gradeId;
  @JsonKey(name: 'gradename')
  String nameGrade;
  Grade();
  factory Grade.fromJson(Map<String,dynamic> json){
    return _$GradeFromJson(json);
  }
  Map<String,dynamic> toJson()=>_$GradeToJson(this);
}