import 'package:json_annotation/json_annotation.dart';
import 'package:tutor_finder_app/models/grade_model.dart';
import 'package:tutor_finder_app/models/learner_model.dart';
part 'post_model.g.dart';
@JsonSerializable()
class Post{
  int postId;
  String title;
  String price;
  String description;
  Learner learner;
  List<Grade> grades;
  Post();
  factory Post.fromJson(Map<String,dynamic>json)=>
      _$PostFromJson(json);
  Map<String,dynamic> toJson()=>_$PostToJson(this);
}