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
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.account_circle),
                  Text("Account")
                ],
              ),
            ),
            Divider(height: 1,color: Colors.black,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Edit profile"),
                Icon(Icons.arrow_forward_ios_outlined),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Change password"),
                Icon(Icons.arrow_forward_ios_outlined),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Facebook"),
                Icon(Icons.arrow_forward_ios_outlined),
              ],
            ),
            SizedBox(height: 8,),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.notifications),
                  Text("Notification")
                ],
              ),
            ),
            Divider(height: 1,color: Colors.black,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Notification"),
                Switch(
                    value: true,
                    onChanged: (value){
                    }
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("App notification"),
                Switch(
                    value: false,
                    onChanged: (value){
                    }
                )
              ],
            ),
            Container(
              child: Text("Logout"),
            )
          ],
        ),
      ),
    );
  }
}