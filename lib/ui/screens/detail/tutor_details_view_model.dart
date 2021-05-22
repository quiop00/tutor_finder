import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';
import 'package:tutor_finder_app/services/api_service.dart';
import 'package:tutor_finder_app/services/locator_getit.dart';

class TutorDetailViewModel extends BaseViewModel {
  final _api = locator<Api>();
  String message;
  getProfile() async {}
  invite(id) async {
    setBusy(true);
    await _api.client.invite(id).then((value) {
      message = 'Mời thành công';
    }).catchError((Object obj) {
      switch (obj.runtimeType) {
        case DioError:
          final res = (obj as DioError).response;
          if (res.data["message"] ==
              "Error: Student can't invite this tutor again!")
            message = "Gia sư này đã được mời";
          else
            message = 'Có lỗi xảy ra';
          break;
      }
    });
    setBusy(false);
    notifyListeners();
  }
}
