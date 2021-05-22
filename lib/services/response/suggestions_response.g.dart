// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggestions_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuggestionsResponse _$SuggestionsResponseFromJson(Map<String, dynamic> json) {
  return SuggestionsResponse()
    ..suggestions = (json['suggestions'] as List)
        ?.map((e) => e == null
            ? null
            : SuggestionResponse.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$SuggestionsResponseToJson(
        SuggestionsResponse instance) =>
    <String, dynamic>{
      'suggestions': instance.suggestions,
    };
