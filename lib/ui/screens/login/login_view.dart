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
  TextEditingController _usernameController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();
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
            top:0,
            child: Container(
              height: MediaQuery.of(context).size.height*0.35,
              width: MediaQuery.of(context).size.width,
              color: Color.fromARGB(255,49,243,208),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('BLACASA',style: TextStyle(fontSize: 35,color: Colors.white),),
                  Text('chia sẻ tri thức - xây dựng tương lai',style: TextStyle(fontSize: 15,color: Colors.white),)
                ],
              ),
            ),
          ),
          Positioned(
              top:MediaQuery.of(context).size.height*0.28,
              left:20,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12,horizontal: 20),
                width: MediaQuery.of(context).size.width-40,
                height: MediaQuery.of(context).size.height*0.28,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow:[
                    BoxShadow(
                       offset: const Offset(0,1),
                       color: Colors.grey.withOpacity(0.2),
                       spreadRadius: 2,
                       blurRadius: 2
                    )
                  ] 
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        hintText: 'Tên người dùng',
                        suffixIcon: Icon(Icons.email_outlined,color: Color.fromARGB(255,49,243,208),)
                      ),
                    ),
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                          hintText: 'Mật khẩu',
                          suffixIcon: Icon(Icons.visibility,color: Color.fromARGB(255,49,243,208),),
                      ),
                    )
                  ],
                ),
              )
          ),
          Positioned(
              top: MediaQuery.of(context).size.height*(0.28+0.28)*0.95,
              left: MediaQuery.of(context).size.width*0.25,
              child: Container(
                width: MediaQuery.of(context).size.width*0.5,
                padding: EdgeInsets.only(top: 10,bottom: 10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255,49,243,208),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow:[
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3), //color of shadow
                      spreadRadius: 2, //spread radius
                      blurRadius: 2, // blur radius
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: Center(
                  child: Text('Đăng nhập', style: TextStyle(fontSize: 15,color: Colors.white),),
                ),
              ),
          ),
          Positioned(
             top:MediaQuery.of(context).size.height*(0.28+0.28)*0.95+60,
             child: Container(
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text('Hoặc',style: TextStyle(fontSize: 15,color: Colors.black54)),
                ),
              )
          ),
          Positioned(
            top: MediaQuery.of(context).size.height*(0.28+0.28)*0.95+80,
            left: MediaQuery.of(context).size.width*0.25,
            child: Container(
              width: MediaQuery.of(context).size.width*0.5,
              padding: EdgeInsets.only(top: 10,bottom: 10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255,49,243,208),
                borderRadius: BorderRadius.circular(20),
                boxShadow:[
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3), //color of shadow
                    spreadRadius: 2, //spread radius
                    blurRadius: 2, // blur radius
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Center(
                child: Text('Đăng ký', style: TextStyle(fontSize: 15,color: Colors.white),),
              ),
            ),
          )
        ],
      ),
    );
  }

}