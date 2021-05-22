import 'package:json_annotation/json_annotation.dart';
import 'package:tutor_finder_app/models/grade_model.dart';
import 'package:tutor_finder_app/models/learner_model.dart';
import 'package:tutor_finder_app/models/schedule_model.dart';
part 'invitation_response.g.dart';

@JsonSerializable()
class InvitationResponse {
  int id;
  int idStudent;
  int idTutor;
  int status;
  InvitationResponse();
  factory InvitationResponse.fromJson(Map<String, dynamic> json) =>
      _$InvitationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$InvitationResponseToJson(this);
}
