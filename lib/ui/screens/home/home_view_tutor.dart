import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:tutor_finder_app/models/post_model.dart';
import 'package:tutor_finder_app/models/tutor_model.dart';
import 'package:tutor_finder_app/services/api_service.dart';
import 'package:tutor_finder_app/services/locator_getit.dart';
import 'package:tutor_finder_app/services/response/post_response.dart';
import 'package:tutor_finder_app/services/response/posts_response.dart';
import 'package:tutor_finder_app/services/response/tutor_response.dart';
import 'package:tutor_finder_app/ui/screens/detail/post_detail_view.dart';
import 'package:tutor_finder_app/ui/screens/detail/tutor_details_view.dart';
import 'package:tutor_finder_app/ui/screens/home/home_view_model_learner.dart';
import 'package:tutor_finder_app/ui/screens/search/search_view.dart';
import 'package:tutor_finder_app/ui/widget/post_item.dart';
import 'package:tutor_finder_app/ui/widget/tutor_item.dart';

import 'home_view_model_tutor.dart';

class HomeViewTutor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeViewTutor();
  }
}

class _HomeViewTutor extends State<HomeViewTutor> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 49, 243, 208),
        title: Text("Bài đăng"),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            width: MediaQuery.of(context).size.width - 10,
            height: 150,
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/tutor.jpg"),
                    fit: BoxFit.cover)),
          ),
          Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.topLeft,
              child: Text(
                "Danh sách lớp học",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              )),
          Flexible(
            child: Container(
              height: MediaQuery.of(context).size.height - 130,
              color: Colors.white,
              child: PostList(),
            ),
          ),
        ]),
      ),
    );
  }
}

// ignore: must_be_immutable
class PostList extends StatelessWidget {
  List<PostResponse> posts;
  final api = locator<Api>();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: api.client.getRecommend(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            posts = snapshot.data.posts;
            return ListView.builder(
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: PostElement(
                    post: posts[index],
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PostDetail(
                                  post: posts[index],
                                )));
                  },
                );
              },
              itemCount: posts.length,
            );
          } else
            return Center(
              child: CircularProgressIndicator(),
            );
        });
  }
}
