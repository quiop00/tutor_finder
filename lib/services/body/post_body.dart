import 'package:json_annotation/json_annotation.dart';
part 'post_body.g.dart';

@JsonSerializable()
class PostBody {
  String title;
  List<String> subject;
  String grade;
  String price;
  String address;
  @JsonKey(name: "phonenumber")
  String phoneNumber;
  String description;
  @JsonKey(name: 'schedules')
  Map<String, bool> schedule;
  PostBody();
  factory PostBody.fromJson(Map<String, dynamic> json) =>
      _$PostBodyFromJson(json);
  Map<String, dynamic> toJson() => _$PostBodyToJson(this);
}
