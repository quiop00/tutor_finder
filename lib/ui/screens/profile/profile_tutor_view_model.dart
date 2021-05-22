import 'package:stacked/stacked.dart';
import 'package:tutor_finder_app/models/tutor_model.dart';
import 'package:tutor_finder_app/services/api_service.dart';
import 'package:tutor_finder_app/services/locator_getit.dart';
import 'package:tutor_finder_app/services/response/tutor_response.dart';

class ProfileTutorViewModel extends BaseViewModel {
  final _api = locator<Api>();
  Tutor tutor;
  getProfile() async {
    await _api.client.getTutorProfile().then((value) {
      tutor = value;
      print(tutor.toJson());
    }).catchError((onError) {});
    notifyListeners();
  }

  uploadImage() async {}
}
