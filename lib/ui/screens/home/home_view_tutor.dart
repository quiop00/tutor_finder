import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:tutor_finder_app/models/post_model.dart';
import 'package:tutor_finder_app/models/tutor_model.dart';
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
          // Stack(
          //   children: [
          //     Positioned(
          //         child: Container(
          //       height: 6 + MediaQuery.of(context).size.height * 0.06,
          //     )),
          //     Positioned(
          //       child: Container(
          //         height: MediaQuery.of(context).size.height * 0.04,
          //         color: Color.fromARGB(255, 49, 243, 208),
          //       ),
          //     ),
          //     Positioned(
          //       top: 5,
          //       left: MediaQuery.of(context).size.width * 0.15,
          //       child: Center(
          //         child: InkWell(
          //           onTap: () {
          //             Navigator.push(
          //                 context,
          //                 MaterialPageRoute(
          //                     builder: (context) => SearchView()));
          //           },
          //           child: Container(
          //               padding: EdgeInsets.all(6),
          //               width: MediaQuery.of(context).size.width * 0.7,
          //               height: MediaQuery.of(context).size.height * 0.06,
          //               decoration: BoxDecoration(
          //                 color: Colors.white,
          //                 borderRadius: BorderRadius.circular(20),
          //                 boxShadow: [
          //                   BoxShadow(
          //                     color: Colors.grey
          //                         .withOpacity(0.3), //color of shadow
          //                     spreadRadius: 2, //spread radius
          //                     blurRadius: 2, // blur radius
          //                     offset:
          //                         Offset(0, 1), // changes position of shadow
          //                   ),
          //                 ],
          //               ),
          //               child: Row(
          //                 children: [
          //                   Icon(
          //                     Icons.search,
          //                     size: 18,
          //                   ),
          //                   SizedBox(
          //                     width: 5,
          //                   ),
          //                   Text(
          //                     "Tìm gia sư",
          //                     style: TextStyle(fontSize: 18),
          //                   )
          //                 ],
          //               )),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          SizedBox(
            height: 10,
          ),
          Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.topLeft,
              child: Text("Danh sách lớp học")),
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
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ViewModelBuilder<HomeViewTutorModel>.reactive(
        builder: (context, model, child) => _listTutors,
        viewModelBuilder: () => HomeViewTutorModel(),
        onModelReady: (model) => model.getTutors(
          onSuccess: () {
            posts = model.postsResponse.posts;
            print(model.postsResponse.toJson());
          },
        ),
      ),
    );
  }

  Widget get _listTutors =>
      Consumer<HomeViewTutorModel>(builder: (context, model, child) {
        // if (model.postsResponse != null) {
        //   posts = model.postsResponse.posts.toList();
        // } else {
        //   return Center(
        //     child: Text('No data'),
        //   );
        // }
        // return ListView.builder(
        //   itemBuilder: (context, index) {
        //     return GestureDetector();
        //   },
        //   itemCount: posts.length,
        // );
        return ListView(
          children: [
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PostDetail()));
                },
                child: PostElement()),
            PostElement(),
          ],
        );
      });
}
