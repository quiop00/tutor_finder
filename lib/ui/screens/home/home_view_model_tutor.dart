import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';
import 'package:tutor_finder_app/models/tutor_model.dart';
import 'package:tutor_finder_app/services/api_service.dart';
import 'package:tutor_finder_app/services/locator_getit.dart';
import 'package:tutor_finder_app/services/response/posts_response.dart';
import 'package:tutor_finder_app/services/response/tutors_response.dart';

class HomeViewTutorModel extends BaseViewModel {
  final _api = locator<Api>();
  PostsResponse postsResponse;
  VoidCallback onSuccess;
  VoidCallback onLoading;
  Function(String) onError;
  void getTutors(
      {VoidCallback onLoading,
      Function(String) onError,
      VoidCallback onSuccess}) async {
    await _api.client.getPosts().then((value) {
      postsResponse = value;
      this.onSuccess = onSuccess;
      notifyListeners();
    });
  }
}
