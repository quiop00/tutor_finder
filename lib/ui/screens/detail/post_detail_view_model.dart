import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';
import 'package:tutor_finder_app/services/api_service.dart';
import 'package:tutor_finder_app/services/locator_getit.dart';

class PostDetailViewModel extends BaseViewModel {
  final _api = locator<Api>();
  String message;
  suggest(idStudent, idPost) async {
    setBusy(true);
    await _api.client.addSuggestion(idStudent, idPost).then((value) {
      message = 'Ứng tuyển thành công';
    }).catchError((Object obj) {
      switch (obj.runtimeType) {
        case DioError:
          //final res = (obj as DioError).response;
          message = 'Có lỗi xảy ra';
          break;
      }
    });
    setBusy(false);
    notifyListeners();
  }
}
