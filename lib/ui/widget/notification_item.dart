import 'package:flutter/material.dart';

class NotificationElement extends StatelessWidget{
  final String notify;
  NotificationElement({this.notify});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Card(
        child: Container(
            padding: EdgeInsets.all(10),
            child: Text(notify)
        ),
      ),
    );
  }

}