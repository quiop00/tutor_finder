import 'package:json_annotation/json_annotation.dart';
import 'package:tutor_finder_app/models/grade_model.dart';
import 'package:tutor_finder_app/models/learner_model.dart';
import 'package:tutor_finder_app/models/schedule_model.dart';
part 'suggestion_response.g.dart';

@JsonSerializable()
class SuggestionResponse {
  @JsonKey(name: 'id')
  int suggestionId;
  int idStudent;
  int idTutor;
  int idPost;
  int status;
  SuggestionResponse();
  factory SuggestionResponse.fromJson(Map<String, dynamic> json) =>
      _$SuggestionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SuggestionResponseToJson(this);
}
