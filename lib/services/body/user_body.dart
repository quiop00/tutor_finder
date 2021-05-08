import 'package:json_annotation/json_annotation.dart';
part 'user_body.g.dart';

@JsonSerializable()
class UserBody {
  int id;
  @JsonKey(name: 'username')
  String userName;
  String password;
  String email;
  @JsonKey(name: 'phonenumber')
  String phoneNumber;
  int age;
  String name;
  bool gender;
  UserBody();
  factory UserBody.fromJson(Map<String, dynamic> json) =>
      _$UserBodyFromJson(json);
  Map<String, dynamic> toJson() => _$UserBodyToJson(this);
}
