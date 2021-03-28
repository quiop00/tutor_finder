import 'package:flutter/material.dart';
import 'package:tutor_finder_app/models/subject_model.dart';
import 'package:tutor_finder_app/models/tutor_model.dart';

class InforTutor extends StatelessWidget{
  final Tutor tutor;
  InforTutor({this.tutor});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(top: 15,left: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _info(Icons.person_outline,"Họ tên: "+tutor.name),
            _info(Icons.location_on,"Địa chỉ: "+ tutor.location),
            _info(Icons.menu_book,"Lớp: "+tutor.grades.map((e) => e.nameGrade).join(", ")),
            _info(Icons.menu_book,"Môn học: "+tutor.subjects.map((e) => e.subjectName).join(", ")),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
  Widget _info(IconData icon,String text){
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon),
          SizedBox(width: 20,),
          Text(text,style: TextStyle(fontSize: 15),)
        ],
      ),
    );
  }
}