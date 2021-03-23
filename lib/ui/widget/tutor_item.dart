import 'package:flutter/material.dart';
import 'package:tutor_finder_app/models/tutor_model.dart';
import 'package:tutor_finder_app/ui/screens/detail/tutor_detail.dart';

class TutorElement extends StatelessWidget{
  final Tutor tutor;
  TutorElement({this.tutor});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Card(
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              margin: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(tutor.avatarPath),
                      fit: BoxFit.cover
                  )
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin:EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(child: Text(tutor.name,style: TextStyle(fontSize: 15),)),
                        ratingBox(int.parse(tutor.rating)),
                      ],
                    ),
                  ),
                  Container(
                    margin:EdgeInsets.fromLTRB(0, 0, 0, 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Container(
                            child: Row(
                              children: [
                                Icon(IconData(0xe8c9, fontFamily:'MyFont'),size: 15,),
                                SizedBox(width: 5,),
                                Text('${tutor.subjects[0].subjectName}',maxLines: 1,overflow: TextOverflow.ellipsis,)
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Row(
                              children: [
                                Icon(Icons.location_on_outlined,size: 15,),
                                Flexible(child: Text(tutor.location,maxLines: 1,overflow: TextOverflow.ellipsis,),)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget ratingBox(int rating){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(rating>=1?Icons.star:Icons.star_border_outlined,color: Colors.amberAccent,),
          Icon(rating>=2?Icons.star:Icons.star_border_outlined,color: Colors.amberAccent,),
          Icon(rating>=3?Icons.star:Icons.star_border_outlined,color: Colors.amberAccent,),
          Icon(rating>=4?Icons.star:Icons.star_border_outlined,color: Colors.amberAccent,),
          Icon(rating==5?Icons.star:Icons.star_border_outlined,color: Colors.amberAccent,)
        ],
      ),
    );
  }
}
