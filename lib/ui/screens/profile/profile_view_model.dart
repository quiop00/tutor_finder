import 'package:stacked/stacked.dart';
import 'package:tutor_finder_app/services/api_service.dart';
import 'package:tutor_finder_app/services/body/user_body.dart';
import 'package:tutor_finder_app/services/locator_getit.dart';

class ProfileViewModel extends BaseViewModel {
  final _api = locator<Api>();
  UserBody userBody;
  getProfile() async {
    setBusy(true);
    await _api.client.getStudentProfile().then((value) {
      userBody = value;
      print(userBody.toJson());
    }).catchError((onError) {
      userBody = UserBody();
    });
    setBusy(false);
    notifyListeners();
  }

  uploadImage() async {}
}
