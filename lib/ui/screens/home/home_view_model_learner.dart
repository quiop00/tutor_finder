import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';
import 'package:tutor_finder_app/models/tutor_model.dart';
import 'package:tutor_finder_app/services/api_service.dart';
import 'package:tutor_finder_app/services/locator_getit.dart';
import 'package:tutor_finder_app/services/response/tutors_response.dart';

class HomeViewLearnerModel extends BaseViewModel {
  final _api = locator<Api>();
  TutorsResponse tutorsResponse;
  VoidCallback onSuccess;
  VoidCallback onLoading;
  Function(String) onError;
  //HomePageViewModel(){} ;
  void getTutors(
      {VoidCallback onLoading,
      Function(String) onError,
      VoidCallback onSuccess}) {}
}
