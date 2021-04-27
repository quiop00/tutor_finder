import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _RegisterView();
  }
}
class _RegisterView extends State<RegisterView>{
  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController phoneNumberController;
  TextEditingController passwordController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController=TextEditingController();
    emailController=TextEditingController();
    passwordController=TextEditingController();
    phoneNumberController=TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đăng ký'),
        backgroundColor: Color.fromARGB(255,49,243,208),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.25,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      padding: EdgeInsets.only(top: 10),
                      color: Color.fromARGB(255,49,243,208),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*0.12,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Đang tạo tài khoản cho Học viên', style: TextStyle(color:Colors.white),)
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      top: MediaQuery.of(context).size.height*0.06/2,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height*0.18,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*0.2,
                              height: MediaQuery.of(context).size.width*0.2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.green,
                                  width: 1
                                ),
                                boxShadow:[
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3), //color of shadow
                                    spreadRadius: 2, //spread radius
                                    blurRadius: 2, // blur radius
                                    offset: Offset(0, 1), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.emoji_people_outlined,size:20),
                                  Text('Học viên',style: TextStyle(fontSize: 15),)
                                ],
                              ),
                            ),
                            SizedBox(width: 15,),
                            Container(
                              width: MediaQuery.of(context).size.width*0.2,
                              height: MediaQuery.of(context).size.width*0.2,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.white,
                                      width: 1
                                  ),
                                  boxShadow:[
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3), //color of shadow
                                      spreadRadius: 2, //spread radius
                                      blurRadius: 2, // blur radius
                                      offset: Offset(0, 1), // changes position of shadow
                                     ),
                                  ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.school,size:20),
                                  Text('Gia sư',style: TextStyle(fontSize: 15),)
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                  ),

                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.68,
              padding: EdgeInsets.only(left: 12,right: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: 'Họ và tên',
                      suffixIcon: Icon(Icons.person_outline)
                    ),
                  ),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                        hintText: 'Email',
                        suffixIcon: Icon(Icons.email)
                    ),
                  ),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                        hintText: 'Số điện thoại',
                        suffixIcon: Icon(Icons.phone_android)
                    ),
                  ),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                        hintText: 'Mật khẩu',
                        suffixIcon: Icon(Icons.visibility_off),
                        helperText: '*Mật khẩu bắt buộc từ 6-32 ký tự'
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
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

          ],
        ),
      ),
    );
  }

}