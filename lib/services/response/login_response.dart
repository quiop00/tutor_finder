import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';
@JsonSerializable()
class LoginResponse{
  String auth;
  String token;
  LoginResponse();
  factory LoginResponse.fromJson(Map<String,dynamic> json){
    return _$LoginResponseFromJson(json);
  }
  Map<String,dynamic> toJson()=>_$LoginResponseToJson(this);
}