import 'package:json_annotation/json_annotation.dart';
import 'package:stacked/stacked.dart';
part 'notification_model.g.dart';
@JsonSerializable()
class NotificationModel {
  String title;
  String content;
  bool readingStatus;
  NotificationModel();
  factory NotificationModel.fromJson(Map<String,dynamic> json)=>
      _$NotificationModelFromJson(json);
  Map<String,dynamic> toJson()=>
      _$NotificationModelToJson(this);
}