import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _WelcomeView();
  }
}
class _WelcomeView extends State<WelcomeView>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height*0.48,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('BLACASA',style: TextStyle(fontSize: 35,color: Color.fromARGB(255,49,243,208)),),
                      Text('chia sẻ tri thức - xây dựng tương lai',style: TextStyle(fontSize: 15,color: Color.fromARGB(255,49,243,208)),)
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 30,right: 30),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5,vertical: 8),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color:Color.fromARGB(255,49,243,208),
                                width: 1.0
                            )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.school,color: Color.fromARGB(255,49,243,208),size: 30,),
                            Text('Tìm giáo viên',style: TextStyle(fontSize: 20,color: Color.fromARGB(255,49,243,208))),
                            Icon(Icons.navigate_next,size: 30,color: Color.fromARGB(255,49,243,208),)
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5,vertical: 8),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color:Color.fromARGB(255,49,243,208),
                                width: 1.0
                            )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.house,color: Color.fromARGB(255,49,243,208),size: 30,),
                            Text('Tìm lớp dạy',style: TextStyle(fontSize: 20,color: Color.fromARGB(255,49,243,208))),
                            Icon(Icons.navigate_next,size: 30,color: Color.fromARGB(255,49,243,208))
                          ],
                        ),
                      ),
                      SizedBox(height: 25,),
                      Container(
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
                      SizedBox(height: 20,),
                      Container(
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
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}