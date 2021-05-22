import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tutor_finder_app/services/local_storage_service.dart';
import 'package:tutor_finder_app/ui/screens/home/home_view_learner.dart';
import 'package:tutor_finder_app/ui/screens/home/home_view_tutor.dart';
import 'package:tutor_finder_app/ui/screens/main/main_view_model.dart';
import 'package:tutor_finder_app/ui/screens/management/post_management_view.dart';
import 'package:tutor_finder_app/ui/screens/management/post_management_view_model.dart';
import 'package:tutor_finder_app/ui/screens/management/request_management_view.dart';
import 'package:tutor_finder_app/ui/screens/notifies/notifications_view.dart';
import 'package:tutor_finder_app/ui/screens/profile/profile_tutor_view.dart';
import 'package:tutor_finder_app/ui/screens/profile/profile_view.dart';
import 'package:tutor_finder_app/ui/screens/search/search_view.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Home();
  }
}

class _Home extends State<Home> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    CupertinoTabView(builder: (context) => HomeViewTutor()),
    CupertinoTabView(
      builder: (context) => SearchView(),
    ),
    CupertinoTabView(
      builder: (context) => NotificationView(),
    ),
    CupertinoTabView(
      builder: (context) => RequestManagementView(),
    ),
    CupertinoTabView(
      builder: (context) => ProfileTutorView(),
    ),
  ];
  String role = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    role = PreferenceUtils.getString('roles');
    if (role == 'ROLE_STUDENT') {
      _widgetOptions[0] =
          CupertinoTabView(builder: (context) => HomeViewLearner());
      _widgetOptions[2] = CupertinoTabView(
        builder: (context) => RequestManagementView(),
      );
      _widgetOptions[3] =
          CupertinoTabView(builder: (context) => PostManagementView());
      _widgetOptions[4] = CupertinoTabView(
        builder: (context) => ProfileView(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onModelReady: (model) {
        model.getRole();
      },
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => CupertinoPageScaffold(
        resizeToAvoidBottomInset: false,
        child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            items: <BottomNavigationBarItem>[
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
                  model.isTutor ? Icons.book : Icons.post_add,
                  size: 30,
                ),
                label: model.isTutor ? 'Yêu cầu' : 'Bài đăng',
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
      ),
    );
  }
}
