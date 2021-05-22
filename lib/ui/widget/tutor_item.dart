import 'package:flutter/material.dart';
import 'package:tutor_finder_app/services/response/tutor_response.dart';

//Tutor element for list view in home page
class TutorElement extends StatelessWidget {
  final TutorResponse tutor;
  TutorElement({this.tutor});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Card(
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          tutor.avatar == null ? '' : tutor.getAvatar()),
                      fit: BoxFit.cover)),
            ),
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
                          tutor.name ?? 'No name',
                          style: TextStyle(fontSize: 15),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )),
                        Icon(Icons.favorite_border)
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 12,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(tutor.rating ?? 'Chưa có đánh giá')
                    ],
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
                          '${tutor.subject?.join(',')}',
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
                            tutor.address ?? '',
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
                              Icons.phone_android,
                              color: Colors.yellow,
                              size: 12,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(tutor.phoneNumber ?? ''),
                          ],
                        )),
                        Container(
                          width: 90,
                          height: 25,
                          padding: EdgeInsets.only(right: 5, bottom: 1),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: RaisedButton(
                            color: Color.fromARGB(255, 49, 243, 208),
                            onPressed: () {},
                            child: Center(child: Text('Mời dạy')),
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

  //this is rating box widget
  Widget ratingBox(int rating) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            rating >= 1 ? Icons.star : Icons.star_border_outlined,
            color: Colors.amberAccent,
          ),
          Icon(
            rating >= 2 ? Icons.star : Icons.star_border_outlined,
            color: Colors.amberAccent,
          ),
          Icon(
            rating >= 3 ? Icons.star : Icons.star_border_outlined,
            color: Colors.amberAccent,
          ),
          Icon(
            rating >= 4 ? Icons.star : Icons.star_border_outlined,
            color: Colors.amberAccent,
          ),
          Icon(
            rating == 5 ? Icons.star : Icons.star_border_outlined,
            color: Colors.amberAccent,
          )
        ],
      ),
    );
  }
}
