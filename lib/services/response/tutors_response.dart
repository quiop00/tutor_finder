import 'package:json_annotation/json_annotation.dart';
import 'package:tutor_finder_app/models/tutor_model.dart';
import 'package:tutor_finder_app/services/response/tutor_response.dart';
part 'tutors_response.g.dart';

@JsonSerializable()
class TutorsResponse {
  List<TutorResponse> tutors;
  TutorsResponse();
  factory TutorsResponse.fromJson(Map<String, dynamic> json) =>
      _$TutorsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TutorsResponseToJson(this);
}
