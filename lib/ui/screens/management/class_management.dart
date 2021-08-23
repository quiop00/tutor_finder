import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutor_finder_app/services/api_service.dart';
import 'package:tutor_finder_app/services/locator_getit.dart';
import 'package:tutor_finder_app/services/response/class_response.dart';
import 'package:tutor_finder_app/services/response/invitations_response.dart';
import 'package:tutor_finder_app/services/response/post_response.dart';
import 'package:tutor_finder_app/services/response/posts_response.dart';
import 'package:tutor_finder_app/services/response/taken_class.dart';
import 'package:tutor_finder_app/ui/screens/detail/post_detail_view.dart';

class ClassManagement extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ClassManagement();
  }
}

class _ClassManagement extends State<ClassManagement> {
  final _api = locator<Api>();
  TakenClass takenClass;
  List<PostResponse> posts;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPost();
  }

  fetchPost() async {
    PostsResponse data;
    await _api.client.getPosts().then((value) => data = value);
    if (data != null) {
      posts = data.posts;
    } else
      posts = [];
  }

  getPost(id) {
    return posts.firstWhere((element) => element.postId == id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 49, 243, 208),
        title: Text("Lớp đang dạy"),
      ),
      body: SafeArea(
          child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height - 50,
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Column(children: [
          SizedBox(
            height: 5,
          ),
          FutureBuilder(
              future: _api.client.getTakenClass(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  takenClass = snapshot.data;
                  return Expanded(
                    child: takenClass.takenClass.length != 0
                        ? Container(
                            height: MediaQuery.of(context).size.height - 70,
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            child: ListView.builder(
                              itemBuilder: (context, index) => PostElement(
                                  takenClass.takenClass[index], index),
                              itemCount: takenClass.takenClass.length,
                            ),
                          )
                        : Container(
                            height: MediaQuery.of(context).size.height - 70,
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            child: Center(
                                child: Text(
                              'Hiện tại chưa nhận lớp nào',
                              style: TextStyle(fontSize: 18),
                            )),
                          ),
                  );
                } else
                  return Center(
                    child: CircularProgressIndicator(),
                  );
              })
        ]),
      )),
    );
  }

  Widget PostElement(ClassResponse item, index) {
    return Container(
      height: 100,
      child: Card(
        child: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PostDetail(
                              post: getPost(item.idPost),
                              isShow: true,
                            )));
              },
              child: Container(
                width: 80,
                height: 80,
                margin: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://e7.pngegg.com/pngimages/396/474/png-clipart-teacher-education-school-classroom-computer-icons-teacher-blue-class.png'),
                        fit: BoxFit.cover)),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Text(
                      item.titlePost ?? 'No name',
                      style: TextStyle(fontSize: 15),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )),
                    Expanded(child: Text('Student: ${item.nameStudent}'))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
