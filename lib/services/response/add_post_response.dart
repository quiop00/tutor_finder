import 'package:json_annotation/json_annotation.dart';
part 'add_post_response.g.dart';

@JsonSerializable()
class AddPostResponse {
  String message;
  AddPostResponse();
  factory AddPostResponse.fromJson(Map<String, dynamic> json) =>
      _$AddPostResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AddPostResponseToJson(this);
}
