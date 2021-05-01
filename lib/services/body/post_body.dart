import 'package:json_annotation/json_annotation.dart';
part 'post_body.g.dart';

@JsonSerializable()
class PostBody {
  String title;
  String subject;
  String topic;
  String price;
  String address;
  String description;
  Map<String, bool> schedule;
  PostBody();
  factory PostBody.fromJson(Map<String, dynamic> json) =>
      _$PostBodyFromJson(json);
  Map<String, dynamic> toJson() => _$PostBodyToJson(this);
}
