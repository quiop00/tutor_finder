import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutor_finder_app/models/schedule_model.dart';

class Schedule extends StatefulWidget{
  final ScheduleModel schedules;
  Schedule({this.schedules});
  @override
  State<StatefulWidget> createState() {
    return _Schedule(schedules: schedules);
  }
}
class _Schedule extends State<Schedule>{
  final ScheduleModel schedules;
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
            height: 30,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index)=>
                    _daySelected(index),
                itemCount: schedules.schedule.length,
            ),
          ),
          Container(
            height: 200,
            child: ListView.builder(
                itemBuilder: (context,index)=>
                    _timeSelected(index)
            ),
          )
        ],
      ),
    );
  }
  //index   0:sunday  -:-  7: saturday
  Widget _daySelected(int index){
    return RaisedButton(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Text(schedules.schedule[index].teachingDay),
        ),
        onPressed: (){
          setState(() {
            _selectedIndex=index;
          });
        }
    );
  }
  Widget _timeSelected(int index){
    return RaisedButton(
        child: Container(
          child: Card(
            child: Text('${schedules.schedule[_selectedIndex].times[index]}'),
          ),
        ),
        onPressed: (){
          setState(() {

          });
        }
    );
  }
}