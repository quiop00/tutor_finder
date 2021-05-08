import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';
import 'package:tutor_finder_app/services/api_service.dart';
import 'package:tutor_finder_app/services/locator_getit.dart';
import 'package:tutor_finder_app/services/response/tutors_response.dart';

class SearchViewModel extends BaseViewModel {
  final _api = locator<Api>();
  TutorsResponse tutorsResponse;
  VoidCallback onLoading;
  VoidCallback onSuccess;
  VoidCallback onError;
  void getTutors(
      {VoidCallback onLoading, VoidCallback onSuccess, VoidCallback onError}) {}
}
