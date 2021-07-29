import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';
import 'package:tutor_finder_app/services/api_service.dart';
import 'package:tutor_finder_app/services/body/register_body.dart';
import 'package:tutor_finder_app/services/locator_getit.dart';

class RegisterViewModel extends BaseViewModel {
  final _api = locator<Api>();
  String message;
  bool isAccept = false;
  bool status = false;
  bool isStudent = true;
  bool isVisible = true;
  List<String> roles = ["student"];
  RegisterBody registerBody = RegisterBody();
  Future<void> register() async {
    if (registerBody == null) return;
    registerBody.role = roles;
    setBusy(true);
    await _api.client.register(registerBody).then((value) {
      message = value.message;
      status = true;
    }).catchError((Object obj) {
      switch (obj.runtimeType) {
        case DioError:
          // Here's the sample to get the failed response error code and message
          final res = (obj as DioError).response;
          message = res.data["message"];
          break;
      }
      status = false;
    });
    setBusy(false);
    notifyListeners();
  }
}
