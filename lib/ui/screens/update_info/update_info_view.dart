import 'package:flutter/material.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet_field.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:tutor_finder_app/models/tutor_model.dart';
import 'package:tutor_finder_app/ui/screens/post/post_view_model.dart';
import 'package:tutor_finder_app/ui/screens/update_info/update_info_view_model.dart';
import 'package:tutor_finder_app/shared/dialog.dart' as dialog;
import 'package:tutor_finder_app/settings.dart' as setting;

class UpdateInfoView extends StatefulWidget {
  final Tutor tutor;
  UpdateInfoView({this.tutor});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _UpdateInfoView(tutor: tutor);
  }
}

class _UpdateInfoView extends State<UpdateInfoView> {
  final Tutor tutor;
  List<String> subjects = setting.subjects;
  List<String> grades = setting.grades;
  var _grades;
  var _subjects;
  _UpdateInfoView({this.tutor});
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _grades = grades.map((e) => MultiSelectItem<String>(e, e)).toList();
    _subjects = subjects.map((e) => MultiSelectItem<String>(e, e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UpdateInfoViewModel>.reactive(
        viewModelBuilder: () => UpdateInfoViewModel(),
        builder: (context, model, child) {
          model.tutor = tutor;
          return Scaffold(
            appBar: AppBar(
              title: Text('Thông tin cá nhân'),
              backgroundColor: Color.fromARGB(255, 49, 243, 208),
            ),
            bottomNavigationBar: Container(
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 50),
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
                        var count = 0;
                        for (var schedule in model.schedules) {
                          if (schedule.morning ||
                              schedule.afternoon ||
                              schedule.night) {
                            count++;
                          }
                        }
                        if (count == 0) {
                          dialog.showAlertDialog(context, 'Lỗi đăng bài',
                              'Vui lòng chọn buổi học');
                          return;
                        }
                        await dialog.onLoading(context);
                        await model.update();
                        dialog.showAlertDialog(
                            context, 'Thông báo', model.message);
                        if (model.message == "OK")
                          Navigator.pushNamed(context, '/home');
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
                                                  'https://manage-tutor-123.herokuapp.com/api/downloadFile/avatar_default.png'),
                                              fit: BoxFit.cover),
                                          border: new Border.all(
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
                                _formField(Icons.book, 'Họ và tên',
                                    validator: (input) {
                                  if (input.length == 0) {
                                    return '';
                                  }
                                  return null;
                                }, onSaved: (input) {
                                  model.tutor.name = input;
                                }),
                                _formField(Icons.book, 'Giới tính',
                                    validator: (input) {
                                  if (input.length == 0) {
                                    return '';
                                  }
                                  return null;
                                }, onSaved: (input) {
                                  model.tutor.address = input;
                                }),
                                _formField(Icons.note_add, 'Số điện thoại',
                                    validator: (input) {
                                  if (input.length == 0) {
                                    return '';
                                  }
                                  return null;
                                }, onSaved: (input) {
                                  model.tutor.phoneNumber = input;
                                }),
                                _formField(
                                    Icons.monetization_on, 'Học vấn / Trình độ',
                                    validator: (input) {
                                  if (input.length == 0) {
                                    return '';
                                  }
                                  return null;
                                }, onSaved: (input) {
                                  model.tutor.qualification = input;
                                }),
                                _formField(Icons.home, 'Địa chỉ',
                                    validator: (input) {
                                  if (input.isEmpty) {
                                    return '';
                                  }
                                  return null;
                                }, onSaved: (input) {
                                  model.tutor.address = input;
                                })
                              ],
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.all(12),
                            alignment: Alignment.topLeft,
                            child: Text("Lớp")),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            height: MediaQuery.of(context).size.height * 0.2,
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
                            child: Column(
                              children: <Widget>[
                                MultiSelectDialogField(
                                  listType: MultiSelectListType.LIST,
                                  searchable: true,
                                  buttonText: Text("Chọn lớp học"),
                                  title: Text("Lớp"),
                                  items: _grades,
                                  onConfirm: (values) {
                                    setState(() {
                                      model.tutor.grades = values;
                                    });
                                  },
                                  chipDisplay: MultiSelectChipDisplay(
                                    items: model.tutor.grades
                                        ?.map((e) =>
                                            MultiSelectItem<String>(e, e))
                                        ?.toList(),
                                    onTap: (value) {
                                      setState(() {
                                        model.tutor.grades.remove(value);
                                      });
                                    },
                                  ),
                                ),
                                model.tutor.grades == null ||
                                        model.tutor.grades.isEmpty
                                    ? Container(
                                        padding: EdgeInsets.all(10),
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "None selected",
                                          style:
                                              TextStyle(color: Colors.black54),
                                        ))
                                    : Container(),
                              ],
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.all(12),
                            alignment: Alignment.topLeft,
                            child: Text("Môn dạy")),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            height: MediaQuery.of(context).size.height * 0.2,
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
                            child: Column(
                              children: <Widget>[
                                MultiSelectDialogField(
                                  listType: MultiSelectListType.LIST,
                                  searchable: true,
                                  buttonText: Text("Chọn môn dạy"),
                                  title: Text("Môn"),
                                  items: _subjects,
                                  onConfirm: (values) {
                                    setState(() {
                                      model.tutor.subjects = values;
                                    });
                                  },
                                  chipDisplay: MultiSelectChipDisplay(
                                    items: model.tutor.subjects
                                        ?.map((e) =>
                                            MultiSelectItem<String>(e, e))
                                        ?.toList(),
                                    onTap: (value) {
                                      setState(() {
                                        model.tutor.subjects.remove(value);
                                      });
                                    },
                                  ),
                                ),
                                model.tutor.subjects == null ||
                                        model.tutor.subjects.isEmpty
                                    ? Container(
                                        padding: EdgeInsets.all(10),
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "None selected",
                                          style:
                                              TextStyle(color: Colors.black54),
                                        ))
                                    : Container(),
                              ],
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.all(12),
                            alignment: Alignment.topLeft,
                            child: Text("Mô tả chi tiết")),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            height: MediaQuery.of(context).size.height * 0.15,
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
                            child: TextFormField(
                              validator: (input) {
                                if (input.length == 0) {
                                  return '';
                                }
                                return null;
                              },
                              onSaved: (input) {
                                model.tutor.description = input;
                              },
                              maxLines: 10,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  border: InputBorder.none,
                                  hintText: 'Giới thiệu bản thân',
                                  hintStyle:
                                      TextStyle(color: Colors.grey[400])),
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.all(12),
                            alignment: Alignment.topLeft,
                            child: Text("Thời gian dạy")),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                              padding: EdgeInsets.all(10),
                              width: MediaQuery.of(context).size.width - 30,
                              height: MediaQuery.of(context).size.height * 0.56,
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
                              child: ListView.builder(
                                itemBuilder: (context, index) =>
                                    _ScheduleElement(index),
                                itemCount: model.schedules.length,
                              )),
                        ),
                      ]),
                ),
              ),
            ),
          );
        });
  }

  Widget _formField(IconData iconData, String hintText, {validator, onSaved}) {
    return Consumer<UpdateInfoViewModel>(
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
              validator: validator,
              onSaved: onSaved,
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

// ignore: non_constant_identifier_names
  Widget _ScheduleElement(index) {
    return Consumer<UpdateInfoViewModel>(
      builder: (context, model, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(model.schedules[index].name),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        model.schedules[index].morning =
                            !model.schedules[index].morning;
                      });
                    },
                    child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20)),
                            color: model.schedules[index].morning
                                ? Colors.greenAccent
                                : Colors.grey),
                        child: Text('Buổi sáng')),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        model.schedules[index].afternoon =
                            !model.schedules[index].afternoon;
                      });
                    },
                    child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: model.schedules[index].afternoon
                                ? Colors.greenAccent
                                : Colors.grey),
                        child: Text('Buổi chiều')),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          model.schedules[index].night =
                              !model.schedules[index].night;
                        });
                      },
                      child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            color: model.schedules[index].night
                                ? Colors.greenAccent
                                : Colors.grey,
                          ),
                          child: Text('Buổi tối')),
                    ),
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
