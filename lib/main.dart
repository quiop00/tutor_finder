import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutor_finder_app/services/locator_getit.dart';
import 'package:tutor_finder_app/ui/screens/home/home_view_learner.dart';
import 'package:tutor_finder_app/ui/screens/invitation/invitation_view.dart';
import 'package:tutor_finder_app/ui/screens/login/login_view.dart';
import 'package:tutor_finder_app/ui/screens/notifies/notifications_view.dart';
import 'package:tutor_finder_app/ui/screens/post/post_view.dart';
import 'package:tutor_finder_app/ui/screens/profile/profile_view.dart';
import 'package:tutor_finder_app/ui/screens/register/register_view.dart';
import 'package:tutor_finder_app/ui/screens/search/search_view.dart';
import 'package:tutor_finder_app/ui/screens/setting/setting_view.dart';
import 'package:tutor_finder_app/ui/screens/welcome/welcome_view.dart';

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
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginView(),
        '/register': (context) => RegisterView(),
        '/home': (context) => Home(),
        '/post': (context) => PostView(),
        '/profile': (context) => ProfileView(),
        '/invitation': (context) => InvitationView()
      },
      home: PostView(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Home();
  }
}

class _Home extends State<Home> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    CupertinoTabView(builder: (context) => HomeViewLearner()),
    CupertinoTabView(
      builder: (context) => SearchView(),
    ),
    CupertinoTabView(
      builder: (context) => NotificationView(),
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    CupertinoTabView(
      builder: (context) => ProfileView(),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search_rounded,
                size: 30,
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
                size: 30,
              ),
              label: 'Notice',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
                size: 30,
              ),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.menu,
                size: 30,
              ),
              label: 'Setting',
            ),
          ],
        ),
        tabBuilder: (context, index) {
          return _widgetOptions[index];
        },
      ),
    );
  }
}
