import 'package:json_annotation/json_annotation.dart';
import 'package:tutor_finder_app/models/tutor_model.dart';
import 'package:tutor_finder_app/services/response/suggestion_response.dart';
import 'package:tutor_finder_app/services/response/tutor_response.dart';
part 'suggestions_response.g.dart';

@JsonSerializable()
class SuggestionsResponse {
  List<SuggestionResponse> suggestions;
  SuggestionsResponse();
  factory SuggestionsResponse.fromJson(Map<String, dynamic> json) =>
      _$SuggestionsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SuggestionsResponseToJson(this);
}
