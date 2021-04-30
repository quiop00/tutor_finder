import 'package:json_annotation/json_annotation.dart';
part 'register_body.g.dart';
@JsonSerializable()
class RegisterBody {
  String username;
  String email;
  @JsonKey(name: 'phonenumber')
  String phoneNumber;
  String password;
  List<String> role;
  RegisterBody();
  factory RegisterBody.fromJson(Map<String,dynamic> json)=>
      _$RegisterBodyFromJson(json);
  Map<String,dynamic> toJson()=>_$RegisterBodyToJson(this);
}