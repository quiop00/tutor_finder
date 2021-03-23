import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutor_finder_app/models/tutor_model.dart';
import 'package:tutor_finder_app/ui/widget/tutor_item.dart';

class TutorDetail extends StatefulWidget{
  final idTutor;
  TutorDetail({this.idTutor});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TutorDetail(idTutor: idTutor);
  }
}
class _TutorDetail extends State<TutorDetail>{
  final idTutor;
  _TutorDetail({this.idTutor});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.white,
        title: Text('Chi tiết'),
      ),
      body: Container(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           children:[
             Container(
               decoration: BoxDecoration(
                 color: Colors.cyan
               ),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                    Text('$idTutor')
                 ],
               ),
             )
           ]
         ),
      ),
    );
  }

}