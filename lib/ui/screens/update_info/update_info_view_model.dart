import 'package:stacked/stacked.dart';
import 'package:tutor_finder_app/models/schedule_model.dart';
import 'package:tutor_finder_app/models/tutor_model.dart';
import 'package:tutor_finder_app/services/api_service.dart';
import 'package:tutor_finder_app/services/body/tutor_body.dart';
import 'package:tutor_finder_app/services/locator_getit.dart';

class UpdateInfoViewModel extends BaseViewModel {
  final _api = locator<Api>();
  Tutor tutor = Tutor();
  String message = 'OK';
  List<Schedule> schedules = Schedule.initSchedules();
  update() async {}
}
