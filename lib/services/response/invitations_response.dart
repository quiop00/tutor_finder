import 'package:json_annotation/json_annotation.dart';
part 'invitations_response.g.dart';

@JsonSerializable()
class InvitationsResponse {
  List<InvitationsResponse> invitations;
  InvitationsResponse();
  factory InvitationsResponse.fromJson(Map<String, dynamic> json) =>
      _$InvitationsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$InvitationsResponseToJson(this);
}
