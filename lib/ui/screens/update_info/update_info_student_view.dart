import 'package:flutter/material.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet_field.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:tutor_finder_app/models/tutor_model.dart';
import 'package:tutor_finder_app/services/body/user_body.dart';
import 'package:tutor_finder_app/ui/screens/main/main_view.dart';
import 'package:tutor_finder_app/ui/screens/post/post_view_model.dart';
import 'package:tutor_finder_app/ui/screens/profile/profile_view.dart';
import 'package:tutor_finder_app/ui/screens/update_info/update_info_view_model.dart';
import 'package:tutor_finder_app/shared/dialog.dart' as dialog;
import 'package:tutor_finder_app/settings.dart' as setting;

import 'update_info_student_view_model.dart';

class UpdateInfoStudentView extends StatefulWidget {
  final UserBody student;
  UpdateInfoStudentView({this.student});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _UpdateInfoStudentView(student: student);
  }
}

class _UpdateInfoStudentView extends State<UpdateInfoStudentView> {
  final UserBody student;
  _UpdateInfoStudentView({this.student});
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UpdateInfoStudentViewModel>.reactive(
        viewModelBuilder: () => UpdateInfoStudentViewModel(),
        builder: (context, model, child) {
          model.userBody = student;
          return Scaffold(
            appBar: AppBar(
              title: Text('Thông tin cá nhân'),
              backgroundColor: Color.fromARGB(255, 49, 243, 208),
            ),
            bottomNavigationBar: Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Cập nhật thông tin'),
                  ElevatedButton(
                      onPressed: () async {
                        if (!_formKey.currentState.validate()) {
                          return;
                        }
                        _formKey.currentState.save();
                        await dialog.onLoading(context, 'Đang xử lý');
                        await model.update();
                        dialog.showAlertDialog(
                            context, 'Thông báo', model.message);
                        if (model.message == "OK")
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Home(
                                        selected: 4,
                                      )));
                      },
                      child: Text('Cập nhật'))
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Form(
                  key: _formKey,
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Positioned(
                                child: Container(
                              height:
                                  6 + MediaQuery.of(context).size.height * 0.3,
                            )),
                            Positioned(
                              child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.26,
                                  color: Color.fromARGB(255, 49, 243, 208),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 120,
                                        height: 120,
                                        margin: EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  'https://storage.googleapis.com/tutor-a4d9d.appspot.com/c67a91c5-e28f-4084-af61-71f1f68ec184jpg'),
                                              fit: BoxFit.cover),
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 2.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.topLeft,
                            child: Text("Thông tin")),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            height: MediaQuery.of(context).size.height * 0.42,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(2),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.3), //color of shadow
                                  spreadRadius: 2, //spread radius
                                  blurRadius: 2, // blur radius
                                  offset: Offset(
                                      0, 1), // changes position of shadow
                                ),
                              ],
                            ),
                            child: ListView(
                              children: [
                                _formField(
                                    student.name, Icons.book, 'Họ và tên',
                                    validator: (input) {
                                  if (input.length == 0) {
                                    return '';
                                  }
                                  return null;
                                }, onSaved: (input) {
                                  model.userBody.name = input;
                                }),
                                Container(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.emoji_people,
                                        color:
                                            Color.fromARGB(255, 49, 243, 208)),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    DropdownButton<int>(
                                      hint: Text("Giới tính"),
                                      value: model.userBody.gender,
                                      items: <int>[0, 1].map((value) {
                                        return DropdownMenuItem<int>(
                                          value: value,
                                          child:
                                              Text(value == 0 ? 'Nữ' : 'Nam'),
                                        );
                                      }).toList(),
                                      onChanged: (val) {
                                        setState(() {
                                          model.userBody.gender = val;
                                        });
                                      },
                                    ),
                                  ],
                                )),
                                _formField(
                                    '${student.age ?? ''}', Icons.book, 'Tuổi',
                                    validator: (input) {
                                  if (input.length == 0) {
                                    return '';
                                  }
                                  return null;
                                }, onSaved: (input) {
                                  model.userBody.age = int.tryParse(input);
                                }, type: TextInputType.number),
                                _formField(
                                    student.phoneNumber ?? '',
                                    Icons.note_add,
                                    'Số điện thoại', validator: (input) {
                                  if (input.length == 0) {
                                    return '';
                                  }
                                  return null;
                                }, onSaved: (input) {
                                  model.userBody.phoneNumber = input;
                                }),
                              ],
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          );
        });
  }

  Widget _formField(initValue, IconData iconData, String hintText,
      {validator, onSaved, type}) {
    return Consumer<UpdateInfoStudentViewModel>(
      builder: (context, model, child) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            iconData,
            color: Color.fromARGB(255, 49, 243, 208),
          ),
          SizedBox(
            width: 2,
          ),
          Expanded(
              child: Container(
            child: TextFormField(
              initialValue: initValue,
              validator: validator,
              onSaved: onSaved,
              keyboardType: type ?? TextInputType.text,
              decoration: InputDecoration(
                errorStyle: TextStyle(height: 0),
                hintText: hintText,
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                hintStyle: TextStyle(color: Colors.grey[400]),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[100]),
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
