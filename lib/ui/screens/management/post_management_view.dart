import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:tutor_finder_app/models/notification_model.dart';
import 'package:tutor_finder_app/services/api_service.dart';
import 'package:tutor_finder_app/services/body/post_body.dart';
import 'package:tutor_finder_app/services/locator_getit.dart';
import 'package:tutor_finder_app/services/response/post_response.dart';
import 'package:tutor_finder_app/services/response/posts_response.dart';
import 'package:tutor_finder_app/ui/screens/management/post_management_view_model.dart';
import 'package:tutor_finder_app/ui/screens/notifies/notifications_view_model.dart';
import 'package:tutor_finder_app/ui/screens/post/edit_post_view.dart';
import 'package:tutor_finder_app/ui/screens/post/post_view.dart';
import 'package:tutor_finder_app/ui/widget/notification_item.dart';

class PostManagementView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PostManagementView();
  }
}

class _PostManagementView extends State<PostManagementView> {
  final _api = locator<Api>();
  PostsResponse posts = PostsResponse();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 49, 243, 208),
        title: Text("Danh sách bài đăng"),
      ),
      body: SafeArea(
          child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height - 50,
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Column(children: [
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width * 0.6,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PostView()));
                },
                child: Text('Thêm bài'),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          FutureBuilder(
              future: _api.client.getPostsByStudent(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  posts = snapshot.data;
                  return Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height - 70,
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      child: ListView.builder(
                        itemBuilder: (context, index) => PostElement(
                          posts.posts[index],
                        ),
                        itemCount: posts.posts.length,
                      ),
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

  //
  // Widget get _postManagementView =>
  //     Consumer<PostManagementVM>(builder: (context, model, child) {
  //       return Container(
  //         color: Colors.white,
  //         height: MediaQuery.of(context).size.height - 50,
  //         padding: EdgeInsets.symmetric(vertical: 15),
  //         child: Column(children: [
  //           Container(
  //             height: 40,
  //             width: MediaQuery.of(context).size.width * 0.6,
  //             decoration: BoxDecoration(
  //               color: Colors.white,
  //             ),
  //             child: Center(
  //               child: ElevatedButton(
  //                 onPressed: () {
  //                   Navigator.push(context,
  //                       MaterialPageRoute(builder: (context) => PostView()));
  //                 },
  //                 child: Text('Thêm bài'),
  //               ),
  //             ),
  //           ),
  //           SizedBox(
  //             height: 5,
  //           ),
  //           model.posts.posts != null
  //               ? Expanded(
  //                   child: Container(
  //                     height: MediaQuery.of(context).size.height - 70,
  //                     padding:
  //                         EdgeInsets.symmetric(vertical: 5, horizontal: 15),
  //                     child: ListView.builder(
  //                       itemBuilder: (context, index) => PostElement(
  //                         model.posts.posts[index],
  //                       ),
  //                       itemCount: model.posts.posts.length,
  //                     ),
  //                   ),
  //                 )
  //               : Center(
  //                   child: Text('No data'),
  //                 ),
  //         ]),
  //       );
  //     });
  Widget PostElement(PostResponse post) {
    return Container(
      height: 100,
      child: Card(
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Text(
                          post.title ?? 'No name',
                          style: TextStyle(fontSize: 15),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 150,
                          height: 25,
                          padding: EdgeInsets.only(right: 5, bottom: 1),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Center(child: Text('Chỉnh sửa')),
                          ),
                        ),
                        Container(
                          width: 90,
                          height: 25,
                          padding: EdgeInsets.only(right: 5, bottom: 1),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Center(child: Text('Xóa')),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
