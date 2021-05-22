import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

showAlertDialog(BuildContext context, String title, String message) {
  // set up the button
  BuildContext dialogContext;
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.pop(dialogContext);
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
      dialogContext = context;
      return alert;
    },
  );
}

onLoading(BuildContext context, String title) async {
  BuildContext dialogContext;
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      dialogContext = context;
      return Dialog(
        child: Container(
          height: 80,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SpinKitCircle(
                color: Colors.redAccent,
              ),
              Text(title),
            ],
          ),
        ),
      );
    },
  );
  await Future.delayed(Duration(seconds: 3), () {
    Navigator.of(dialogContext).pop(); //pop dialog
  });
}
