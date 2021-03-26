import 'package:json_annotation/json_annotation.dart';
import 'package:stacked/stacked.dart';
import 'package:tutor_finder_app/models/notification_model.dart';
part 'notification_response.g.dart';
@JsonSerializable()
class NotificationResponse {
  List<NotificationModel> notifies;
  NotificationResponse();
  factory NotificationResponse.fromJson(Map<String,dynamic> json)=>
      _$NotificationResponseFromJson(json);
  Map<String,dynamic> toJson()=>
      _$NotificationResponseToJson(this);
}