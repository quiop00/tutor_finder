// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invitations_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvitationsResponse _$InvitationsResponseFromJson(Map<String, dynamic> json) {
  return InvitationsResponse()
    ..invitations = (json['invitations'] as List)
        ?.map((e) => e == null
            ? null
            : InvitationResponse.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$InvitationsResponseToJson(
        InvitationsResponse instance) =>
    <String, dynamic>{
      'invitations': instance.invitations,
    };
