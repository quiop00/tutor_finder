import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';
import 'package:tutor_finder_app/services/api_service.dart';
import 'package:tutor_finder_app/services/body/login_body.dart';
import 'package:tutor_finder_app/services/local_storage_service.dart';
import 'package:tutor_finder_app/services/locator_getit.dart';
import 'package:tutor_finder_app/services/response/login_response.dart';

class LoginViewModel extends BaseViewModel {
  final _api = locator<Api>();

  LoginResponse loginResponse;
  String errorMessage;
  bool status;
  Future<void> checkLogin(LoginBody loginBody) async {
    setBusy(true);
    await _api.client.checkLogin(loginBody).then((value) {
      loginResponse = value;
      status = true;
    }).catchError((Object obj) {
      switch (obj.runtimeType) {
        case DioError:
          // Here's the sample to get the failed response error code and message
          final res = (obj as DioError).response;
          if (res.data["error"] == "Unauthorized") {
            errorMessage = "Tên đăng nhập hoặc mật khẩu không chính xác";
          } else
            errorMessage = res.data["error"];
          break;
      }
      status = false;
    });
    if (status) {
      await PreferenceUtils.setString(
          'token', 'Bearer ' + loginResponse.accessToken);
      await PreferenceUtils.setString('roles', loginResponse.roles[0]);
    } else
      await PreferenceUtils.setString('token', 'Bearer');
    print(PreferenceUtils.getString('token'));
    setBusy(false);
    notifyListeners();
  }
}
