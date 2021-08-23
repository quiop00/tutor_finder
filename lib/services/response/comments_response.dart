import 'package:json_annotation/json_annotation.dart';
import 'package:tutor_finder_app/models/comments_model.dart';

part 'comments_response.g.dart';

@JsonSerializable()
class CommentsResponse {
  List<CommentModel> comments;
  CommentsResponse();
  factory CommentsResponse.fromJson(Map<String, dynamic> json) =>
      _$CommentsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CommentsResponseToJson(this);
}
