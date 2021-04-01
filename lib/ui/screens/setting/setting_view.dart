import 'package:flutter/material.dart';

class SettingView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SettingView();
  }
}
class _SettingView extends State<SettingView>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Danh mục học viên',style: TextStyle(color: Colors.white),),),
        backgroundColor: Color.fromARGB(255,49,243,208),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
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
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height*0.26,
                        color: Color.fromARGB(255,49,243,208),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 90,
                              height: 90,
                              margin: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                   image: NetworkImage('https://ict-imgs.vgcloud.vn/2020/09/01/19/huong-dan-tao-facebook-avatar.jpg'),
                                   fit: BoxFit.cover
                                  ),
                                border: new Border.all(
                                  color: Colors.white,
                                  width: 2.0,
                                ),
                              ),
                            ),
                            Text('Mai Hoàng Đức',style:TextStyle(fontSize: 20,color: Colors.white),),
                          ],
                        )
                      ),
                  ),
                  Positioned(
                      left: MediaQuery.of(context).size.width*0.5-10,
                      top: 90,
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255,49,243,208),
                          border: new Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        ),
                        child: Center(
                            child:Icon(Icons.photo_camera,size: 15,color: Colors.white,)
                        ),
                      )
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height*0.22,
                    left: MediaQuery.of(context).size.width*0.08,
                    right: MediaQuery.of(context).size.width*0.08,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height*0.45,
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.circular(2),
                        boxShadow:[
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3), //color of shadow
                            spreadRadius: 2, //spread radius
                            blurRadius: 2, // blur radius
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: ListView(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.note_add,size: 30,color: Color.fromARGB(255,49,243,208),),
                                  SizedBox(width: 8,),
                                  Text('Quản lý yêu cầu',style: TextStyle(fontSize: 20),),
                                ],
                              ),
                              Icon(Icons.navigate_next,size: 30)
                            ],
                          ),
                          SizedBox(height: 5,),
                          Divider(height: 1,),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.favorite,size: 30,color: Color.fromARGB(255,49,243,208)),
                                  SizedBox(width: 8,),
                                  Text('Giáo viên đã lưu',style: TextStyle(fontSize: 20)),
                                ],
                              ),
                              Icon(Icons.navigate_next,size: 30)
                            ],
                          ),
                          SizedBox(height: 5,),
                          Divider(height: 1,),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.account_circle,size: 30,color: Color.fromARGB(255,49,243,208)),
                                  SizedBox(width: 8,),
                                  Text('Thông tin cá nhân',style: TextStyle(fontSize: 20)),
                                ],
                              ),
                              Icon(Icons.navigate_next,size: 30)
                            ],
                          ),
                          SizedBox(height: 5,),
                          Divider(height: 1,),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.settings,size: 30,color: Color.fromARGB(255,49,243,208)),
                                  SizedBox(width: 8,),
                                  Text('Trợ giúp & Cài đặt',style: TextStyle(fontSize: 20)),
                                ],
                              ),
                              Icon(Icons.navigate_next,size: 30)
                            ],
                          ),
                          SizedBox(height: 5,),
                          Divider(height: 1,),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.logout,size: 30,color: Color.fromARGB(255,49,243,208)),
                                  SizedBox(width: 8,),
                                  Text('Đăng xuất',style: TextStyle(fontSize: 20)),
                                ],
                              ),
                              Icon(Icons.navigate_next,size: 30)
                            ],
                          ),
                          SizedBox(height: 5,),
                          Divider(height: 1,),
                        ],
                      ),
                    )
                  ),
                ],
              ),
              Flexible(
                  child: Container(
                    height: 50,
                    child: Text('A'),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}