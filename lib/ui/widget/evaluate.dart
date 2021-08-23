import 'package:flutter/material.dart';
import 'package:tutor_finder_app/models/comments_model.dart';
import 'package:tutor_finder_app/models/tutor_model.dart';
import 'package:tutor_finder_app/services/api_service.dart';
import 'package:tutor_finder_app/services/locator_getit.dart';
import 'package:tutor_finder_app/services/response/comments_response.dart';

class EvaluateWidget extends StatefulWidget {
  final int id;
  final Future<CommentsResponse> fetchComments;
  EvaluateWidget({Key key, this.id, this.fetchComments}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return EvaluateWidgetState(id: id);
  }
}

class EvaluateWidgetState extends State<EvaluateWidget> {
  final int id;
  EvaluateWidgetState({this.id});
  final _api = locator<Api>();
  var fetchComments;
  List<CommentModel> comments;
  var height;
  TextEditingController commentTextEditController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    height = 100.0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        child: FutureBuilder(
          future: widget.fetchComments,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              comments = snapshot.data.comments;
              comments =
                  comments.where((element) => element.idTutor == id).toList();
              return comments.length > 0
                  ? ListView.builder(
                      itemBuilder: (context, index) {
                        return _comment(index);
                      },
                      itemCount: comments.length,
                    )
                  : Center(
                      child: Text('Không có đánh giá nào'),
                    );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }

  Widget _comment(int index) => Card(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Align(
                child: Row(
                  children: [
                    Icon(Icons.account_circle),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      comments[index].nameStudent,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                alignment: Alignment.topLeft,
              ),
              Text(comments[index].content)
            ],
          ),
        ),
      );
}
