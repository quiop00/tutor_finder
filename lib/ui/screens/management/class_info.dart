import 'package:flutter/material.dart';

class ClassInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ClassInfo();
  }
}

class _ClassInfo extends State<ClassInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết lớp học'),
      ),
      body: FutureBuilder(
        future: null,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container();
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
