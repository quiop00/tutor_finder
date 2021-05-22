import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';
import 'package:tutor_finder_app/models/schedule_model.dart';
import 'package:tutor_finder_app/models/tutor_model.dart';
import 'package:tutor_finder_app/services/api_service.dart';
import 'package:tutor_finder_app/services/body/tutor_body.dart';
import 'package:tutor_finder_app/services/locator_getit.dart';
import 'package:tutor_finder_app/services/response/tutor_response.dart';

class UpdateInfoViewModel extends BaseViewModel {
  final _api = locator<Api>();
  Tutor tutor;
  String message = 'OK';
  List<Schedule> schedules = [];
  update() async {
    setBusy(true);
    tutor.schedules = {};
    tutor.schedules = Schedule.covertScheduleToJson(schedules);
    print(tutor.subject.join(','));
    await _api.client.updateTutor(tutor).then((value) {
      print('OK');
    }).catchError((Object obj) {
      switch (obj.runtimeType) {
        case DioError:
          // Here's the sample to get the failed response error code and message
          final res = (obj as DioError).response;
          print('error');
          print(res);
          break;
      }
    });
    setBusy(false);
    notifyListeners();
  }
}
