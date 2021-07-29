import 'package:json_annotation/json_annotation.dart';

part 'class_response.g.dart';

@JsonSerializable()
class ClassResponse {
  int idStudent;
  int idPost;
  String nameStudent;
  String titlePost;
  ClassResponse();
  factory ClassResponse.fromJson(Map<String, dynamic> json) =>
      _$ClassResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ClassResponseToJson(this);
}
