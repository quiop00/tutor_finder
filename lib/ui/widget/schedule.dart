import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutor_finder_app/models/day_model.dart';
import 'package:tutor_finder_app/models/schedule_model.dart';


//Schedule teaching of tutor
class Schedule extends StatefulWidget{
  final List<DayScheduleTutor> schedules;
  Schedule({this.schedules});
  @override
  State<StatefulWidget> createState() {
    return _Schedule(schedules: schedules);
  }
}
class _Schedule extends State<Schedule>{
  final List<DayScheduleTutor> schedules;
  _Schedule({this.schedules});
  int _selectedIndex;
  @override
  void initState() {
    super.initState();
    _selectedIndex=0;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 40,
            padding: EdgeInsets.only(left: 20,top:10),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index)=>
                    _daySelected(index),
                itemCount: schedules.length,
            ),
          ),
          Container(
            height: 250,
            child: ListView.builder(
                itemBuilder: (context,i)=>
                    _timeSelected(i),
                itemCount: schedules[_selectedIndex].times.length,
            ),
          )
        ],
      ),
    );
  }
  //index   0:sunday  -:-  7: saturday
  Widget _daySelected(int index){
    return RaisedButton(
        color:  _selectedIndex==index?Colors.blueAccent:Colors.white,
        child: Container(
          child: Text(schedules[index].teachingDay),
        ),
        onPressed: (){
          setState(() {
            _selectedIndex=index;
          });
        }
    );
  }
  Widget _timeSelected(int index){
    bool status=schedules[_selectedIndex].times[index].status;
    return Container(
      height: 40,
      margin: EdgeInsets.only(left: 10,right: 10),
      child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              Container(
                 margin: EdgeInsets.only(left: 10),
                 child: Text('${schedules[_selectedIndex].times[index].startingTime} - ${schedules[_selectedIndex].times[index].endTime}')
              ),
              status?Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.green,
                ),
                margin: EdgeInsets.only(right: 10),
                padding: EdgeInsets.all(5),
                child: Text('Đã đặt',style: TextStyle(fontSize: 12),),
              ):Text('')
            ],
       ),
      ),
    );
  }
}