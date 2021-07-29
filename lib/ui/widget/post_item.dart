import 'package:flutter/material.dart';
import 'package:tutor_finder_app/models/post_model.dart';
import 'package:tutor_finder_app/services/response/post_response.dart';
import 'package:tutor_finder_app/services/response/tutor_response.dart';

//Tutor element for list view in home page
class PostElement extends StatelessWidget {
  final PostResponse post;
  PostElement({this.post});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Card(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Text(
                            post.title ?? 'Cần tìm gia sư',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 15),
                          )),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            IconData(0xe8c9, fontFamily: 'MyFont'),
                            size: 12,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            post.grade ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            IconData(0xe8c9, fontFamily: 'MyFont'),
                            size: 12,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            post.subjects?.map((e) => e)?.join(','),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 12,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            child: Text(
                              post.address ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.monetization_on,
                                color: Colors.yellow,
                                size: 12,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text('${post.price ?? '0'} đ/h'),
                            ],
                          )),
                          Container(
                            width: 120,
                            height: 25,
                            padding: EdgeInsets.only(right: 5, bottom: 1),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: RaisedButton(
                              color: Color.fromARGB(255, 49, 243, 208),
                              onPressed: () {},
                              child: Center(child: Text('Đề nghị dạy')),
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
      ),
    );
  }
}
