import 'package:flutter/material.dart';
import 'package:tutor_finder_app/models/tutor_model.dart';
import 'package:tutor_finder_app/services/api_service.dart';
import 'package:tutor_finder_app/services/locator_getit.dart';

class EvaluateWidget extends StatefulWidget {
  final int id;
  EvaluateWidget({this.id});
  @override
  State<StatefulWidget> createState() {
    return _EvaluateWidget(id: id);
  }
}

class _EvaluateWidget extends State<EvaluateWidget> {
  final int id;
  _EvaluateWidget({this.id});
  final _api = locator<Api>();
  TextEditingController commentTextEditController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      // child: FutureBuilder(
      //   future: _api.client.,
      // )
    );
  }
  // Widget _comment(int index)=>
  //     Card(
  //       child: Container(
  //         padding: EdgeInsets.all(10),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //           children: [
  //             Align(
  //                 child: Row(
  //                   children: [
  //                     Icon(Icons.account_circle),
  //                     Text(tutor.comments[index].user)
  //                   ],
  //                 ),
  //                 alignment: Alignment.topLeft,
  //             ),
  //             Align(
  //               alignment: Alignment.centerLeft,
  //               child: Text("12/3/2021"),
  //             ),
  //             Text(tutor.comments[index].content)
  //           ],
  //         ),
  //       ),
  //     );
}
