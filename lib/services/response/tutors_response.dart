import 'package:json_annotation/json_annotation.dart';
import 'package:tutor_finder_app/models/tutor_model.dart';
part 'tutors_response.g.dart';
@JsonSerializable()
class TutorsResponse{
  List<Tutor> tutors;
  TutorsResponse();
  factory TutorsResponse.fromJson(Map<String,dynamic> json)=>
      _$TutorsResponseFromJson(json);
  Map<String,dynamic> toJson()=>_$TutorsResponseToJson(this);
}