import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutor_finder_app/services/locator_getit.dart';
import 'package:tutor_finder_app/ui/screens/home/home_view_learner.dart';
import 'package:tutor_finder_app/ui/screens/home/home_view_tutor.dart';
import 'package:tutor_finder_app/ui/screens/invitation/invitation_view.dart';
import 'package:tutor_finder_app/ui/screens/login/login_view.dart';
import 'package:tutor_finder_app/ui/screens/notifies/notifications_view.dart';
import 'package:tutor_finder_app/ui/screens/post/post_view.dart';
import 'package:tutor_finder_app/ui/screens/profile/profile_view.dart';
import 'package:tutor_finder_app/ui/screens/register/register_view.dart';
import 'package:tutor_finder_app/ui/screens/splash/splash_screen.dart';
import 'ui/screens/main/main_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashPage(),
        '/login': (context) => LoginView(),
        '/register': (context) => RegisterView(),
        '/home': (context) => Home(),
        '/post': (context) => PostView(),
        '/profile': (context) => ProfileView(),
        '/invitation': (context) => InvitationView(),
      },
    );
  }
}
