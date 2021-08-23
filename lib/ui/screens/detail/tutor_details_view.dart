import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tutor_finder_app/models/schedule_model.dart';
import 'package:tutor_finder_app/services/api_service.dart';
import 'package:tutor_finder_app/services/local_storage_service.dart';
import 'package:tutor_finder_app/services/locator_getit.dart';
import 'package:tutor_finder_app/services/response/tutor_response.dart';
import 'package:tutor_finder_app/ui/screens/detail/tutor_details_view_model.dart';
import 'package:tutor_finder_app/shared/dialog.dart' as dialog;
import 'package:tutor_finder_app/ui/widget/evaluate.dart';
import 'package:url_launcher/url_launcher.dart';

class TutorsDetail extends StatefulWidget {
  final id;
  TutorsDetail({this.id});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TutorDetail(id: id);
  }
}

class _TutorDetail extends State<TutorsDetail> {
  final id;
  _TutorDetail({this.id});
  List<Schedule> schedules = [];
  var tutor;
  final api = locator<Api>();
  final _formKey = GlobalKey<FormState>();
  final _commentKey = GlobalKey<EvaluateWidgetState>();
  var invited;
  String content;
  var fetchComments;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var data = PreferenceUtils.getString('tutor_$id') ?? 'false';
    invited = data == 'true';
    fetchComments = api.client.getComments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelBuilder<TutorDetailViewModel>.reactive(
        viewModelBuilder: () => TutorDetailViewModel(),
        onModelReady: (model) async {
          await model.getProfile(id);
          if (model.tutor.schedules != null) {
            schedules = Schedule.schedulesFromJson(model.tutor.schedules);
          } else
            schedules = Schedule.initSchedules();
        },
        builder: (context, model, child) => model.tutor != null
            ? Scaffold(
                appBar: AppBar(
                  title: Text("Chi tiết gia sư"),
                  backgroundColor: Color.fromARGB(255, 49, 243, 208),
                ),
                bottomNavigationBar: Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(invited
                          ? 'Hủy bỏ lời mời gia sư này'
                          : 'Mời gia sư này'),
                      ElevatedButton(
                        onPressed: invited
                            ? null
                            : () async {
                                await dialog.onLoading(context, 'Đang xử lý');
                                await model.invite(model.tutor.id);
                                await PreferenceUtils.setString(
                                    'tutor_$id', 'true');
                                dialog.showAlertDialog(
                                    context, 'Hoàn tất', model.message);
                                setState(() {
                                  invited = true;
                                });
                              },
                        child: invited ? Text('Đã mời') : Text('Mời dạy'),
                      ),
                    ],
                  ),
                ),
                body: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.29,
                          child: Stack(
                            children: [
                              Positioned(
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  color: Color.fromARGB(255, 49, 243, 208),
                                ),
                              ),
                              Positioned(
                                top: 5,
                                left: MediaQuery.of(context).size.width * 0.15,
                                child: Center(
                                  child: Container(
                                      padding: EdgeInsets.all(6),
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.25,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 90,
                                            height: 90,
                                            margin: EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        model.tutor.avatar ??
                                                            ''),
                                                    fit: BoxFit.cover)),
                                          ),
                                          Text(
                                              '${model.tutor.name ?? 'No name'}'),
                                          Text(
                                              '${model.tutor.phoneNumber ?? ''}'),
                                        ],
                                      )),
                                ),
                              ),
                              Positioned(
                                  top: 28 +
                                      MediaQuery.of(context).size.height * 0.1,
                                  left:
                                      MediaQuery.of(context).size.width * 0.455,
                                  child: Container(
                                    width: 34,
                                    height: 20,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
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
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 12,
                                        ),
                                        Text(
                                          '${model.tutor.rating ?? '0'}',
                                          style: TextStyle(fontSize: 12),
                                        )
                                      ],
                                    ),
                                  )),
                              Positioned(
                                top: MediaQuery.of(context).size.height * 0.25 -
                                    15,
                                left: MediaQuery.of(context).size.width * 0.29,
                                child: Center(
                                    child: Row(
                                  children: [
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15))),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Color.fromARGB(
                                                    255, 49, 243, 208)),
                                      ),
                                      child: Text('Đánh giá'),
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text('Đánh giá'),
                                                content: Stack(
                                                  children: <Widget>[
                                                    Positioned(
                                                      right: -40.0,
                                                      top: -40.0,
                                                      child: InkResponse(
                                                        onTap: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: CircleAvatar(
                                                          child:
                                                              Icon(Icons.close),
                                                          backgroundColor:
                                                              Colors.red,
                                                        ),
                                                      ),
                                                    ),
                                                    Form(
                                                      key: _formKey,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: <Widget>[
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child:
                                                                TextFormField(
                                                              validator:
                                                                  (input) {
                                                                if (input
                                                                        .length ==
                                                                    0) {
                                                                  return 'Nhập nội dung';
                                                                }
                                                                return null;
                                                              },
                                                              onSaved: (input) {
                                                                content = input;
                                                              },
                                                              maxLines: 3,
                                                              decoration: InputDecoration(
                                                                  contentPadding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              10),
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  hintText:
                                                                      'Nhập nội dung',
                                                                  hintStyle: TextStyle(
                                                                      color: Colors
                                                                              .grey[
                                                                          400])),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child:
                                                                ElevatedButton(
                                                              onPressed:
                                                                  () async {
                                                                if (_formKey
                                                                    .currentState
                                                                    .validate()) {
                                                                  _formKey
                                                                      .currentState
                                                                      .save();
                                                                } else
                                                                  return;
                                                                await api.client
                                                                    .comment({
                                                                  'idTutor': id,
                                                                  'content':
                                                                      content
                                                                }).catchError(
                                                                        (onError) {
                                                                  print(
                                                                      onError);
                                                                });
                                                                setState(() {
                                                                  fetchComments = api
                                                                      .client
                                                                      .getComments();
                                                                });
                                                                Navigator.pop(
                                                                    context);
                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (BuildContext
                                                                            context) {
                                                                      return AlertDialog(
                                                                          title:
                                                                              Text('Đánh giá thành công'));
                                                                    });
                                                              },
                                                              child: Text(
                                                                  'Đánh giá'),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            });
                                      },
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15))),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Color.fromARGB(
                                                    255, 49, 243, 208)),
                                      ),
                                      child: Icon(
                                        Icons.call,
                                        color: Colors.indigo,
                                      ),
                                      onPressed: () {
                                        launch(
                                            'tel:${model.tutor.phoneNumber}');
                                      },
                                    ),
                                  ],
                                )),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 120,
                          padding: EdgeInsets.only(left: 25, right: 25),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 30,
                                    width: (MediaQuery.of(context).size.width -
                                            60) /
                                        2,
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 209, 212, 221),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.menu_book,
                                          size: 15,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          '${model.tutor.subject?.map((e) => e)?.join(", ")}',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    width: (MediaQuery.of(context).size.width -
                                            60) /
                                        2,
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 209, 212, 221),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.person,
                                          size: 15,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          '${model.tutor.grade?.map((e) => e)?.join(", ")}',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 30,
                                    width: (MediaQuery.of(context).size.width -
                                            60) /
                                        2,
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 209, 212, 221),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.monetization_on,
                                          size: 15,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          '50000đ/h',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    width: (MediaQuery.of(context).size.width -
                                            60) /
                                        2,
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 209, 212, 221),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          size: 15,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Flexible(
                                            child: Text(
                                          '${model.tutor.address ?? ''}',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ))
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
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
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.only(left: 15),
                                          height: 25,
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 49, 243, 208),
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight:
                                                      Radius.circular(10))),
                                          child: Text(
                                            'Thông tin',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                        ),
                                      ),
                                    ]),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    '${model.tutor.description ?? 'Không có mô tả'}',
                                    style: TextStyle(fontSize: 15),
                                    maxLines: 10,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
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
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.only(left: 15),
                                          height: 25,
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 49, 243, 208),
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight:
                                                      Radius.circular(10))),
                                          child: Text(
                                            'Lịch dạy',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                        ),
                                      ),
                                    ]),
                                Container(
                                    padding: EdgeInsets.all(10),
                                    width:
                                        MediaQuery.of(context).size.width - 30,
                                    height: MediaQuery.of(context).size.height *
                                        0.54,
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
                                    child: ListView.builder(
                                      itemCount: schedules.length,
                                      itemBuilder: (context, index) => Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(schedules[index].name),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.7,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 8),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                    padding: EdgeInsets.all(8),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        20),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        20)),
                                                        color: schedules[index]
                                                                .morning
                                                            ? Colors.greenAccent
                                                            : Colors.grey),
                                                    child: Text('Buổi sáng')),
                                                Container(
                                                    padding: EdgeInsets.all(8),
                                                    decoration: BoxDecoration(
                                                        color: schedules[index]
                                                                .afternoon
                                                            ? Colors.greenAccent
                                                            : Colors.grey),
                                                    child: Text('Buổi chiều')),
                                                Expanded(
                                                  child: Container(
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        20),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        20)),
                                                        color: schedules[index]
                                                                .night
                                                            ? Colors.greenAccent
                                                            : Colors.grey,
                                                      ),
                                                      child: Text('Buổi tối')),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
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
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.only(left: 15),
                                          height: 25,
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 49, 243, 208),
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight:
                                                      Radius.circular(10))),
                                          child: Text(
                                            'Đánh giá',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                        ),
                                      ),
                                    ]),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: EvaluateWidget(
                                    id: model.tutor.id,
                                    fetchComments: fetchComments,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 60,
                        )
                      ],
                    ),
                  ),
                ))
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
