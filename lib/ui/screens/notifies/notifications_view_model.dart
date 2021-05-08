import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';
import 'package:tutor_finder_app/services/api_service.dart';
import 'package:tutor_finder_app/services/locator_getit.dart';
import 'package:tutor_finder_app/services/response/notification_response.dart';

class NotificationViewModel extends BaseViewModel {
  final _api = locator<Api>();
  NotificationResponse notificationResponse;
  VoidCallback onSuccess;
  void getNotificationsById({VoidCallback onSuccess}) {}
}
