import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

showAlertDialog(BuildContext context, String title, String message) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(message),
    actions: [
      okButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

onLoading(BuildContext context) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        child: Container(
          height: 80,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SpinKitCircle(
                color: Colors.redAccent,
              ),
              Text("Đang đăng bài vui lòng chờ"),
            ],
          ),
        ),
      );
    },
  );
  await Future.delayed(new Duration(seconds: 3), () {
    Navigator.pop(context); //pop dialog
  });
}
