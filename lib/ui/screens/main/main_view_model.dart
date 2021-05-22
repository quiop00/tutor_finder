import 'package:stacked/stacked.dart';
import 'package:tutor_finder_app/services/local_storage_service.dart';

class HomeViewModel extends BaseViewModel {
  String role = "ROLE_STUDENT";
  bool isTutor = false;
  getRole() async {
    role = PreferenceUtils.getString('roles');
    if (role == 'ROLE_TUTOR') isTutor = true;
    notifyListeners();
  }
}
