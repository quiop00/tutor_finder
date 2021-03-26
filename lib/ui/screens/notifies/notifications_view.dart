import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:tutor_finder_app/models/notification_model.dart';
import 'package:tutor_finder_app/services/response/notification_response.dart';
import 'package:tutor_finder_app/ui/screens/notifies/notifications_view_model.dart';
import 'package:tutor_finder_app/ui/widget/notification_item.dart';

class NotificationView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _NotificationView();
  }
}
class _NotificationView extends State<NotificationView>{
  List<NotificationModel> notifies;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ViewModelBuilder<NotificationViewModel>.reactive(
            builder: (context,model,child)=>_notificationElement,
            viewModelBuilder: ()=>NotificationViewModel(),
            onModelReady: (model)=>model.getNotificationsById(
              onSuccess: (){
                notifies=model.notificationResponse.notifies;
              }
            )
          ,
        ),
      ),
    );
  }
  Widget get _notificationElement=>
      Consumer<NotificationViewModel>(
          builder: (context,model,child) {
            if(model.notificationResponse!=null){
              notifies=model.notificationResponse.notifies;
            }
            else{
              return Container();
            }
            return Column(
              children:[
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width*0.6,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text("Thông báo"),
                  ),
                ),
                SizedBox(height: 5,),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height-70,
                    child: ListView.builder(
                      itemBuilder: (context,index)=>
                          NotificationElement(notify: notifies[index].content,),
                      itemCount: notifies.length,
                    ),
                  ),
                ),
              ]
            );
          }
      );
}