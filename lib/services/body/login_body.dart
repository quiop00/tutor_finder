import 'package:json_annotation/json_annotation.dart';
part 'login_body.g.dart';
@JsonSerializable()
class LoginBody{
  String username;
  String password;
  LoginBody();
  factory LoginBody.fromJson(Map<String,dynamic> json)=>
  _$LoginBodyFromJson(json);
  Map<String,dynamic> toJson()=>_$LoginBodyToJson(this);
}