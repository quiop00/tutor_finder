import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';
import 'package:tutor_finder_app/models/schedule_model.dart';
import 'package:tutor_finder_app/services/api_service.dart';
import 'package:tutor_finder_app/services/body/post_body.dart';
import 'package:tutor_finder_app/services/locator_getit.dart';

class PostViewModel extends BaseViewModel {
  final _api = locator<Api>();
  PostBody postBody = PostBody();
  String message = 'OK';
  List<Schedule> schedules = Schedule.initSchedules();
  post() async {
    setBusy(true);
    covertScheduleToJson();
    print(postBody.toJson());
    await _api.client.post(postBody).then((value) {
      message = value.message;
    }).catchError((Object obj) {
      switch (obj.runtimeType) {
        case DioError:
          // Here's the sample to get the failed response error code and message
          final res = (obj as DioError).response;
          print(res);
          break;
      }
    });
    setBusy(false);
    notifyListeners();
  }

  void covertScheduleToJson() {
    postBody.schedule = {};
    postBody.schedule['sang_2'] = schedules[0].morning;
    postBody.schedule['chieu_2'] = schedules[0].afternoon;
    postBody.schedule['toi_2'] = schedules[0].night;
    postBody.schedule['sang_3'] = schedules[1].morning;
    postBody.schedule['chieu_3'] = schedules[1].afternoon;
    postBody.schedule['toi_3'] = schedules[1].night;
    postBody.schedule['sang_4'] = schedules[2].morning;
    postBody.schedule['chieu_4'] = schedules[2].afternoon;
    postBody.schedule['toi_4'] = schedules[2].night;
    postBody.schedule['sang_5'] = schedules[3].morning;
    postBody.schedule['chieu_5'] = schedules[3].afternoon;
    postBody.schedule['toi_5'] = schedules[3].night;
    postBody.schedule['sang_6'] = schedules[4].morning;
    postBody.schedule['chieu_6'] = schedules[4].afternoon;
    postBody.schedule['toi_6'] = schedules[4].night;
    postBody.schedule['sang_7'] = schedules[5].morning;
    postBody.schedule['chieu_7'] = schedules[5].afternoon;
    postBody.schedule['toi_7'] = schedules[5].night;
    postBody.schedule['sang_CN'] = schedules[6].morning;
    postBody.schedule['chieu_CN'] = schedules[6].afternoon;
    postBody.schedule['toi_CN'] = schedules[6].night;
  }

  void scheduleFromJson() {}
}
