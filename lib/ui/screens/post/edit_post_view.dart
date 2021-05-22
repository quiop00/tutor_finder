import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:tutor_finder_app/models/schedule_model.dart';
import 'package:tutor_finder_app/services/body/post_body.dart';
import 'package:tutor_finder_app/services/response/post_response.dart';
import 'package:tutor_finder_app/ui/screens/post/post_view_model.dart';
import 'package:tutor_finder_app/shared/dialog.dart' as dialog;
import 'package:tutor_finder_app/settings.dart' as setting;

class PostEditView extends StatefulWidget {
  final PostResponse post;
  final isEdit;
  PostEditView({this.post, this.isEdit});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PostEditView(post: post, isEdit: isEdit);
  }
}

class _PostEditView extends State<PostEditView> {
  final PostResponse post;
  final bool isEdit;
  _PostEditView({this.post, this.isEdit});
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<Schedule> schedules = [];
  List<String> subjects = setting.subjects;
  List<String> grades = setting.grades;
  var _subjects;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (post.schedules != null) {
      schedules = Schedule.schedulesFromJson(post.schedules);
    } else
      schedules = Schedule.initSchedules();
    _subjects = subjects.map((e) => MultiSelectItem<String>(e, e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PostViewModel>.reactive(
        onModelReady: (model) {
          model.schedules = schedules;
        },
        viewModelBuilder: () => PostViewModel(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                title: Text('Xem yêu cầu'),
                backgroundColor: Color.fromARGB(255, 49, 243, 208),
              ),
              bottomNavigationBar: isEdit
                  ? Container(
                      padding: EdgeInsets.only(left: 15, right: 15, bottom: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Xem yêu cầu này ngay'),
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
                                  dialog.showAlertDialog(context,
                                      'Lỗi đăng bài', 'Vui lòng chọn buổi học');
                                  return;
                                }
                                await dialog.onLoading(
                                    context, 'Đang đăng bài');
                                await model.post();
                                dialog.showAlertDialog(
                                    context, 'Thông báo', model.message);
                                if (model.message == "OK")
                                  Navigator.pushNamed(context, '/home');
                              },
                              child: Text('Đăng yêu cầu'))
                        ],
                      ),
                    )
                  : Container(),
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
                                height: 6 +
                                    MediaQuery.of(context).size.height * 0.06,
                              )),
                              Positioned(
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.04,
                                  color: Color.fromARGB(255, 49, 243, 208),
                                ),
                              ),
                              Positioned(
                                top: 5,
                                left: MediaQuery.of(context).size.width * 0.15,
                                child: Center(
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                        padding: EdgeInsets.all(6),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.06,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(
                                                  0.3), //color of shadow
                                              spreadRadius: 2, //spread radius
                                              blurRadius: 2, // blur radius
                                              offset: Offset(0,
                                                  1), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          child: TextFormField(
                                            enabled: isEdit,
                                            initialValue: post.title,
                                            validator: (input) {
                                              if (input.isEmpty) return '';
                                              return null;
                                            },
                                            onSaved: (input) {
                                              model.postBody.title = input;
                                            },
                                            decoration: InputDecoration(
                                                errorStyle:
                                                    TextStyle(height: 0),
                                                contentPadding:
                                                    EdgeInsets.all(10),
                                                border: InputBorder.none,
                                                hintText:
                                                    'Tóm tắt yêu cầu tìm gia sư',
                                                hintStyle: TextStyle(
                                                    color: Colors.grey[300])),
                                          ),
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.topLeft,
                              child: Text("Yêu cầu")),
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
                              child: Column(
                                children: [
                                  Container(
                                      padding: EdgeInsets.all(12),
                                      alignment: Alignment.topLeft,
                                      child: Text("Môn học")),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.2,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(2),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(
                                                0.3), //color of shadow
                                            spreadRadius: 2, //spread radius
                                            blurRadius: 2, // blur radius
                                            offset: Offset(0,
                                                1), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        children: <Widget>[
                                          // MultiSelectDialogField(
                                          //   initialValue:
                                          //       model.postBody.subject,
                                          //   listType: MultiSelectListType.LIST,
                                          //   searchable: true,
                                          //   buttonText: Text("Chọn môn dạy"),
                                          //   title: Text("Môn"),
                                          //   items: _subjects,
                                          //   // onConfirm: (values) {
                                          //   //   setState(() {
                                          //   //     model.postBody.subject = values;
                                          //   //   });
                                          //   // },
                                          // ),
                                          post.subjects == null ||
                                                  post.subjects.isEmpty
                                              ? Container(
                                                  padding: EdgeInsets.all(10),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "None selected",
                                                    style: TextStyle(
                                                        color: Colors.black54),
                                                  ))
                                              : MultiSelectChipDisplay(
                                                  items: post.subjects
                                                      .map((e) =>
                                                          MultiSelectItem(e, e))
                                                      .toList(),
                                                ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  _formField(post.grade, Icons.note_add, 'Lớp',
                                      validator: (input) {
                                    if (input.length == 0) {
                                      return '';
                                    }
                                    return null;
                                  }, onSaved: (input) {
                                    model.postBody.grade = input;
                                  }),
                                  _formField(post.price, Icons.monetization_on,
                                      'Học phí dự kiến (VND/buổi)',
                                      validator: (input) {
                                    if (input.length == 0) {
                                      return '';
                                    }
                                    return null;
                                  }, onSaved: (input) {
                                    model.postBody.price = input;
                                  }),
                                  _formField(
                                      post.phoneNumber,
                                      Icons.phone_android,
                                      'Số điện thoại', validator: (input) {
                                    if (input.isEmpty) {
                                      return 'Không được bỏ trống';
                                    }
                                    return null;
                                  }, onSaved: (input) {
                                    model.postBody.phoneNumber = input;
                                  }),
                                  _formField(post.address, Icons.home,
                                      'Địa chỉ cụ thể', validator: (input) {
                                    if (input.isEmpty) {
                                      return '';
                                    }
                                    return null;
                                  }, onSaved: (input) {
                                    model.postBody.address = input;
                                  })
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
                                initialValue: post.description,
                                validator: (input) {
                                  if (input.length == 0) {
                                    return '';
                                  }
                                  return null;
                                },
                                onSaved: (input) {
                                  model.postBody.description = input;
                                },
                                maxLines: 10,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    border: InputBorder.none,
                                    hintText: 'Tóm tắt yêu cầu tìm gia sư',
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400])),
                              ),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.all(12),
                              alignment: Alignment.topLeft,
                              child: Text("Thời gian học")),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Container(
                                padding: EdgeInsets.all(10),
                                width: MediaQuery.of(context).size.width - 30,
                                height:
                                    MediaQuery.of(context).size.height * 0.56,
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
                                  itemCount: schedules.length,
                                )),
                          ),
                        ]),
                  ),
                ),
              ),
            ));
  }

  Widget _formField(initValue, IconData iconData, String hintText,
      {validator, onSaved}) {
    return Consumer<PostViewModel>(
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
              initialValue: initValue ?? '',
              enabled: isEdit,
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
    return Consumer<PostViewModel>(
      builder: (context, model, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(schedules[index].name),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      if (!isEdit) return;
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
                      if (!isEdit) return;
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
                        if (!isEdit) return;
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
