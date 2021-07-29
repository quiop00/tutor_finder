import 'package:json_annotation/json_annotation.dart';
import 'package:tutor_finder_app/services/response/post_response.dart';

import 'class_response.dart';
part 'taken_class.g.dart';

@JsonSerializable()
class TakenClass {
  @JsonKey(name: 'class')
  List<ClassResponse> takenClass;
  TakenClass();
  factory TakenClass.fromJson(Map<String, dynamic> json) =>
      _$TakenClassFromJson(json);
  Map<String, dynamic> toJson() => _$TakenClassToJson(this);
}
