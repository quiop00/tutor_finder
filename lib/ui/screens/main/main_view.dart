import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tutor_finder_app/services/local_storage_service.dart';
import 'package:tutor_finder_app/ui/screens/home/home_view_learner.dart';
import 'package:tutor_finder_app/ui/screens/home/home_view_tutor.dart';
import 'package:tutor_finder_app/ui/screens/main/main_view_model.dart';
import 'package:tutor_finder_app/ui/screens/management/class_management.dart';
import 'package:tutor_finder_app/ui/screens/management/invitation_management.dart';
import 'package:tutor_finder_app/ui/screens/management/post_management_view.dart';
import 'package:tutor_finder_app/ui/screens/management/post_management_view_model.dart';
import 'package:tutor_finder_app/ui/screens/management/request_management_view.dart';
import 'package:tutor_finder_app/ui/screens/notifies/notifications_view.dart';
import 'package:tutor_finder_app/ui/screens/profile/profile_tutor_view.dart';
import 'package:tutor_finder_app/ui/screens/profile/profile_view.dart';
import 'package:tutor_finder_app/ui/screens/search/search_view.dart';

class Home extends StatefulWidget {
  final int selected;
  Home({this.selected = 0});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Home();
  }
}

class _Home extends State<Home> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  var selectedIndex;
  List<Widget> _widgetOptions = <Widget>[
    HomeViewTutor(),
    SearchView(),
    InvitationManagementView(),
    ClassManagement(),
    ProfileTutorView(),
  ];
  String role = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedIndex = widget.selected;
    role = PreferenceUtils.getString('roles');
    if (role == 'ROLE_STUDENT') {
      _widgetOptions[0] = HomeViewLearner();
      _widgetOptions[2] = RequestManagementView();
      _widgetOptions[3] = PostManagementView();
      _widgetOptions[4] = ProfileView();
    }
  }

  Widget getBody() {
    return _widgetOptions[selectedIndex];
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onModelReady: (model) {
        model.getRole();
      },
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        body: this.getBody(),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              // sets the background color of the `BottomNavigationBar`
              canvasColor: Color.fromARGB(255, 49, 243, 208),
              // sets the active color of the `BottomNavigationBar` if `Brightness` is light
              primaryColor: Colors.red,
              textTheme: Theme.of(context)
                  .textTheme
                  .copyWith(caption: new TextStyle(color: Colors.yellow))),
          child: BottomNavigationBar(
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.white,
            currentIndex: this.selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
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
                label: model.isTutor ? 'Lớp' : 'Bài đăng',
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
        ),
      ),
    );
  }
}
