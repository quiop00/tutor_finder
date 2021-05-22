import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tutor_finder_app/models/schedule_model.dart';
import 'package:tutor_finder_app/services/api_service.dart';
import 'package:tutor_finder_app/services/body/post_body.dart';
import 'package:tutor_finder_app/services/locator_getit.dart';

class PostViewModel extends BaseViewModel {
  final _api = locator<Api>();
  PostBody postBody = PostBody();
  String message = 'OK';
  List<Schedule> schedules = [];
  post() async {
    setBusy(true);
    postBody.schedule = Schedule.covertScheduleToJson(schedules);

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
}
