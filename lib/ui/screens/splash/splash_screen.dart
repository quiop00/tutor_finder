import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:tutor_finder_app/services/api_service.dart';
import 'package:tutor_finder_app/services/local_storage_service.dart';
import 'package:tutor_finder_app/services/locator_getit.dart';
import 'package:tutor_finder_app/ui/screens/login/login_view.dart';
import 'package:tutor_finder_app/ui/screens/main/main_view.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SplashPage> {
  final _api = locator<Api>();
  checkSession() async {
    var path = '/login';
    await Future.delayed(Duration(milliseconds: 1000));
    var role = PreferenceUtils.getString('roles');
    print(role);
    if (role == 'ROLE_STUDENT')
      await _api.client.getStudentProfile().then((value) {
        path = '/home';
      }).catchError((onError) {});
    else if (role == 'ROLE_TUTOR') {
      await _api.client.getTutorProfile().then((value) {
        path = '/home';
      }).catchError((onError) {});
    }
    print('hr');
    if (PreferenceUtils.getString('token') == null ||
        PreferenceUtils.getString('token') == '') path = '/login';
    return Future.value(path);
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      navigateAfterFuture: checkSession(),
      title: Text(
        'TUTOR FINDER',
        style: TextStyle(color: Colors.white, fontSize: 30),
      ),
      photoSize: 100,
      loaderColor: Colors.red,
      imageBackground: AssetImage('assets/images/background.jpg'),
    );
  }
}
