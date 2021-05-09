import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:tutor_finder_app/models/tutor_model.dart';
import 'package:tutor_finder_app/ui/screens/profile/profile_view_model.dart';
import 'package:tutor_finder_app/ui/screens/update_info/update_info_view.dart';

import 'profile_tutor_view_model.dart';

class ProfileTutorView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProfileTutorView();
  }
}

class _ProfileTutorView extends State<ProfileTutorView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Danh mục gia sư',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 49, 243, 208),
      ),
      body: SingleChildScrollView(
        child: ViewModelBuilder<ProfileTutorViewModel>.reactive(
          viewModelBuilder: () => ProfileTutorViewModel(),
          builder: (context, model, child) => Container(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Positioned(
                      child: Container(
                    height: MediaQuery.of(context).size.height - 20,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                  )),
                  Positioned(
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.26,
                        color: Color.fromARGB(255, 49, 243, 208),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 90,
                              height: 90,
                              margin: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://manage-tutor-123.herokuapp.com/api/downloadFile/avatar_default.png'),
                                    fit: BoxFit.cover),
                                border: new Border.all(
                                  color: Colors.white,
                                  width: 2.0,
                                ),
                              ),
                            ),
                            Text(
                              'Mai Hoàng Đức',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ],
                        )),
                  ),
                  Positioned(
                      left: MediaQuery.of(context).size.width * 0.5 - 10,
                      top: 90,
                      child: InkWell(
                        onTap: () async {
                          File _image;
                          ImagePicker picker = ImagePicker();
                          final pickedFile = await picker.getImage(
                              source: ImageSource.gallery);
                          if (pickedFile != null) {
                            _image = File(pickedFile.path);
                          }
                        },
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 49, 243, 208),
                            border: new Border.all(
                              color: Colors.white,
                              width: 2.0,
                            ),
                          ),
                          child: Center(
                              child: Icon(
                            Icons.photo_camera,
                            size: 15,
                            color: Colors.white,
                          )),
                        ),
                      )),
                  Positioned(
                      top: MediaQuery.of(context).size.height * 0.22,
                      left: MediaQuery.of(context).size.width * 0.08,
                      right: MediaQuery.of(context).size.width * 0.08,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        height: MediaQuery.of(context).size.height * 0.45,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.3), //color of shadow
                              spreadRadius: 2, //spread radius
                              blurRadius: 2, // blur radius
                              offset:
                                  Offset(0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        child: ListView(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.note_add,
                                      size: 30,
                                      color: Color.fromARGB(255, 49, 243, 208),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      'Quản lý đề nghị dạy',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                                Icon(Icons.navigate_next, size: 30)
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Divider(
                              height: 1,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.favorite,
                                        size: 30,
                                        color:
                                            Color.fromARGB(255, 49, 243, 208)),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text('Lớp học đã lưu',
                                        style: TextStyle(fontSize: 20)),
                                  ],
                                ),
                                Icon(Icons.navigate_next, size: 30)
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Divider(
                              height: 1,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            InkWell(
                              onTap: () {
                                Tutor tutor = Tutor();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UpdateInfoView(
                                              tutor: tutor,
                                            )));
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.account_circle,
                                          size: 30,
                                          color: Color.fromARGB(
                                              255, 49, 243, 208)),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text('Thông tin cá nhân',
                                          style: TextStyle(fontSize: 20)),
                                    ],
                                  ),
                                  Icon(Icons.navigate_next, size: 30)
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Divider(
                              height: 1,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.settings,
                                        size: 30,
                                        color:
                                            Color.fromARGB(255, 49, 243, 208)),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text('Cài đặt tài khoản',
                                        style: TextStyle(fontSize: 20)),
                                  ],
                                ),
                                Icon(Icons.navigate_next, size: 30)
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Divider(
                              height: 1,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.logout,
                                        size: 30,
                                        color:
                                            Color.fromARGB(255, 49, 243, 208)),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text('Đăng xuất',
                                        style: TextStyle(fontSize: 20)),
                                  ],
                                ),
                                Icon(Icons.navigate_next, size: 30)
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Divider(
                              height: 1,
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ],
          )),
        ),
      ),
    );
  }
}
