import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
part 'comments_model.g.dart';

@JsonSerializable()
class CommentModel {
  int id;
  int idStudent;
  String nameStudent;
  int idTutor;
  String content;
  CommentModel();
  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);
  Map<String, dynamic> toJson() => _$CommentModelToJson(this);
}
