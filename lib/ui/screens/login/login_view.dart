import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginView();
  }

}
class _LoginView extends State<LoginView>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đăng nhập'),
        backgroundColor: Color.fromARGB(255,49,243,208),
      ),
      body: Stack(
        children: [
          Positioned(
              child: Container(
                height: MediaQuery.of(context).size.height-20,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
              )
          ),
          Positioned(
            child: Container(
              height: MediaQuery.of(context).size.height*0.4,
              width: MediaQuery.of(context).size.width,
              color: Color.fromARGB(255,49,243,208),
            ),
          ),
        ],
      ),
    );
  }

}