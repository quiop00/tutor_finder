import 'package:json_annotation/json_annotation.dart';
import 'package:tutor_finder_app/models/post_model.dart';
part 'posts_response.g.dart';
@JsonSerializable()
class PostsResponse{
  List<Post> posts;
  PostsResponse();
  factory PostsResponse.fromJson(Map<String,dynamic> json)=>
      _$PostsResponseFromJson(json);
  Map<String,dynamic> toJson()=>_$PostsResponseToJson(this);
}