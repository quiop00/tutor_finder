import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';
import 'package:tutor_finder_app/models/schedule_model.dart';
import 'package:tutor_finder_app/models/tutor_model.dart';
import 'package:tutor_finder_app/services/api_service.dart';
import 'package:tutor_finder_app/services/body/tutor_body.dart';
import 'package:tutor_finder_app/services/body/user_body.dart';
import 'package:tutor_finder_app/services/locator_getit.dart';

class UpdateInfoStudentViewModel extends BaseViewModel {
  final _api = locator<Api>();
  UserBody userBody;
  String message = 'OK';
  update() async {
    setBusy(true);
    await _api.client.updateStudent(userBody).then((value) {
      print('OK');
    }).catchError((Object obj) {
      switch (obj.runtimeType) {
        case DioError:
          // Here's the sample to get the failed response error code and message
          final res = (obj as DioError).response;
          message = 'Có lỗi xảy ra';
          print(res);
          break;
      }
    });
    setBusy(false);
    notifyListeners();
  }
}
