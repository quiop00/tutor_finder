import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tutor_finder_app/models/schedule_model.dart';
import 'package:tutor_finder_app/services/api_service.dart';
import 'package:tutor_finder_app/services/local_storage_service.dart';
import 'package:tutor_finder_app/services/locator_getit.dart';
import 'package:tutor_finder_app/services/response/post_response.dart';
import 'package:tutor_finder_app/shared/dialog.dart' as dialog;
import 'package:tutor_finder_app/ui/screens/detail/post_detail_view_model.dart';

class PostDetail extends StatefulWidget {
  final PostResponse post;
  final bool isShow;
  PostDetail({this.post, this.isShow = false});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PostDetail(post: post);
  }
}

class _PostDetail extends State<PostDetail> {
  final PostResponse post;
  _PostDetail({this.post});
  List<Schedule> schedules = [];
  var suggested;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var data = PreferenceUtils.getString('post_${post.postId}') ?? 'false';
    suggested = data == 'true';
    if (post.schedules != null) {
      schedules = Schedule.schedulesFromJson(post.schedules);
    } else
      schedules = Schedule.initSchedules();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PostDetailViewModel>.reactive(
        viewModelBuilder: () => PostDetailViewModel(),
        builder: (context, model, child) {
          return Scaffold(
              appBar: AppBar(
                title: Text("Chi tiết bài đăng"),
                backgroundColor: Color.fromARGB(255, 49, 243, 208),
              ),
              bottomNavigationBar: Container(
                padding: EdgeInsets.only(left: 15, right: 15, bottom: 5),
                child: widget.isShow
                    ? Container(height: 20, child: Text('Đang dạy'))
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Gửi lời đề nghị dạy'),
                          ElevatedButton(
                              onPressed: suggested
                                  ? null
                                  : () async {
                                      await dialog.onLoading(
                                          context, 'Đang xử lý');
                                      await model.suggest(
                                          post.idStudent, post.postId);
                                      setState(() {
                                        suggested = true;
                                      });
                                      dialog.showAlertDialog(
                                          context, 'Hoàn tất', model.message);
                                    },
                              child: Text(
                                  suggested ? 'Chờ phản hồi' : 'Đề nghị dạy'))
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
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.22,
                                  color: Color.fromARGB(255, 49, 243, 208),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        margin: EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  'https://img.favpng.com/24/16/9/teacher-computer-icons-education-tutor-class-png-favpng-uuQpzywM5EP9ZQ3wRSq5nHELE.jpg'),
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
                            Positioned(
                              top: MediaQuery.of(context).size.height * 0.22 -
                                  15,
                              left: MediaQuery.of(context).size.width * 0.1,
                              child: Center(
                                child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                      padding: EdgeInsets.all(6),
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
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
                                      child: Center(child: Text(post.title))),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          height: MediaQuery.of(context).size.height * 0.38,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.book,
                                        size: 30,
                                        color:
                                            Color.fromARGB(255, 49, 243, 208),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        'Môn học: ${post.subjects?.join(',')}',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.favorite,
                                          size: 30,
                                          color: Color.fromARGB(
                                              255, 49, 243, 208)),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text('Lớp: ${post.grade}',
                                          style: TextStyle(fontSize: 20)),
                                    ],
                                  ),
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
                                      Text('Phí: ${post.price} đồng/ buổi',
                                          style: TextStyle(fontSize: 20)),
                                    ],
                                  ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.location_on,
                                          size: 30,
                                          color: Color.fromARGB(
                                              255, 49, 243, 208)),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text('Địa chỉ: ${post.address}',
                                          style: TextStyle(fontSize: 20)),
                                    ],
                                  ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.phone_android,
                                          size: 30,
                                          color: Color.fromARGB(
                                              255, 49, 243, 208)),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text('SĐT liên lạc: ${post.phoneNumber}',
                                          style: TextStyle(fontSize: 20)),
                                    ],
                                  ),
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
                                offset:
                                    Offset(0, 1), // changes position of shadow
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
                                                topRight: Radius.circular(10))),
                                        child: Text(
                                          'Yêu cầu chi tiết',
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
                                  post.description ?? 'Không có mô tả',
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
                                offset:
                                    Offset(0, 1), // changes position of shadow
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
                                                topRight: Radius.circular(10))),
                                        child: Text(
                                          'Lịch học',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  ]),
                              Container(
                                  padding: EdgeInsets.all(10),
                                  width: MediaQuery.of(context).size.width - 30,
                                  height:
                                      MediaQuery.of(context).size.height * 0.54,
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                  padding: EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(20),
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
                                                    padding: EdgeInsets.all(8),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(20),
                                                              bottomRight:
                                                                  Radius
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
                    ],
                  ),
                ),
              ));
        });
  }
}
