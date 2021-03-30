import 'package:flutter/material.dart';

class SettingView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SettingView();
  }
}
class _SettingView extends State<SettingView>{
  final TextStyle categoryStyle=TextStyle(fontSize: 25);
  final TextStyle childStyle=TextStyle(fontSize: 20);
  final sizedBox=20.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        color: Colors.white,
        child: ListView(
          children: [
            Text('Settings',style: TextStyle(fontSize: 30),),
            SizedBox(height: 20,),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.account_circle,size: 25,),
                  Text("Account",style: categoryStyle,)
                ],
              ),
            ),
            Divider(height: 1,color: Colors.black,),
            SizedBox(height: sizedBox,),
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Edit profile",style: childStyle,),
                  Icon(Icons.arrow_forward_ios_outlined),
                ],
              ),
              onTap: (){},
            ),
            SizedBox(height: sizedBox,),
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Change password",style: childStyle),
                  Icon(Icons.arrow_forward_ios_outlined),
                ],
              ),
              onTap: (){},
            ),
            SizedBox(height: sizedBox,),
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Facebook",style: childStyle),
                  Icon(Icons.arrow_forward_ios_outlined),
                ],
              ),
              onTap: (){

              },
            ),
            SizedBox(height: 12,),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.notifications,size: 25,color: Colors.yellow,),
                  Text("Notification",style: categoryStyle)
                ],
              ),
            ),
            Divider(height: 1,color: Colors.black,),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Notification",style: childStyle),
                Switch(
                    value: true,
                    onChanged: (value){
                    }
                )
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("App notification",style: childStyle),
                Switch(
                    value: false,
                    onChanged: (value){
                    }
                )
              ],
            ),
            SizedBox(height: 10,),
            Container(
              child: Text("Logout"),
            )
          ],
        ),
      ),
    );
  }
}