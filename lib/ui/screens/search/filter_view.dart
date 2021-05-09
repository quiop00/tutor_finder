import 'package:flutter/material.dart';

class FilterView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FilterView();
  }
}

class _FilterView extends State<FilterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bộ lọc'),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
