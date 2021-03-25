import 'package:flutter/material.dart';

class RatingBox extends StatelessWidget{
  final rating;
  RatingBox({this.rating});
  @override
  Widget build(BuildContext context) {
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