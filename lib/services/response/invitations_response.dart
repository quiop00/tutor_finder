import 'package:json_annotation/json_annotation.dart';

import 'invitation_response.dart';
part 'invitations_response.g.dart';

@JsonSerializable()
class InvitationsResponse {
  List<InvitationResponse> invitations;
  InvitationsResponse();
  factory InvitationsResponse.fromJson(Map<String, dynamic> json) =>
      _$InvitationsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$InvitationsResponseToJson(this);
}
