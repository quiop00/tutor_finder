import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:tutor_finder_app/models/notification_model.dart';
import 'package:tutor_finder_app/services/api_service.dart';
import 'package:tutor_finder_app/services/locator_getit.dart';
import 'package:tutor_finder_app/ui/screens/notifies/notifications_view_model.dart';
import 'package:tutor_finder_app/ui/widget/notification_item.dart';

class NotificationView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NotificationView();
  }
}

class _NotificationView extends State<NotificationView> {
  List<NotificationModel> notifies;
  final _api = locator<Api>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
        height: 40,
        width: MediaQuery.of(context).size.width * 0.6,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: Text("Thông báo"),
        ),
      ),
      SizedBox(
        height: 5,
      ),
      Expanded(
        child: Container(
          height: MediaQuery.of(context).size.height - 70,
          child: FutureBuilder(
              future: _api.client.getSuggestion(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  var data = snapshot.data;
                  return ListView.builder(
                    itemBuilder: (context, index) => NotificationElement(
                      notify: notifies[index].content,
                    ),
                    itemCount: notifies.length,
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ),
      ),
    ]));
  }
}
