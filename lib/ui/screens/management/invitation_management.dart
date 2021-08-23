import 'package:flutter/material.dart';
import 'package:tutor_finder_app/services/api_service.dart';
import 'package:tutor_finder_app/services/locator_getit.dart';
import 'package:tutor_finder_app/services/response/invitation_response.dart';
import 'package:tutor_finder_app/services/response/invitations_response.dart';
import 'package:tutor_finder_app/shared/dialog.dart' as dialog;
import 'package:tutor_finder_app/ui/screens/main/main_view.dart';

class InvitationManagementView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InvitationManagementView();
  }
}

class _InvitationManagementView extends State<InvitationManagementView> {
  final _api = locator<Api>();
  InvitationsResponse invitations = InvitationsResponse();
  var fetch;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch = _api.client.getInvitation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 49, 243, 208),
        title: Text(""),
      ),
      body: SafeArea(
          child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height - 50,
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Column(children: [
          Container(
            width: MediaQuery.of(context).size.width - 20,
            height: 40,
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                border: Border.symmetric(
                    vertical: BorderSide(color: Colors.grey, width: 5),
                    horizontal: BorderSide(color: Colors.grey, width: 3))),
            child: Center(
              child: Text(
                'Thông báo',
                style: TextStyle(color: Colors.blueAccent, fontSize: 20),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          FutureBuilder(
              future: fetch,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  invitations = snapshot.data;
                  if (invitations.invitations.length != 0)
                    return Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height - 70,
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        child: ListView.builder(
                          itemBuilder: (context, index) => InvitationElement(
                            invitations.invitations[index],
                          ),
                          itemCount: invitations.invitations.length,
                        ),
                      ),
                    );
                  return Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height - 70,
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      child: Center(
                          child: Text(
                        'Không có thông báo',
                        style: TextStyle(fontSize: 18),
                      )),
                    ),
                  );
                } else
                  return Center(
                    child: CircularProgressIndicator(),
                  );
              })
        ]),
      )),
    );
  }

  Widget InvitationElement(InvitationResponse invitation) {
    return Container(
      height: 100,
      child: Card(
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              margin: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://storage.googleapis.com/tutor-a4d9d.appspot.com/c67a91c5-e28f-4084-af61-71f1f68ec184jpg'),
                      fit: BoxFit.cover)),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Text(
                          invitation.nameStudent + ' đã mời bạn dạy học',
                          style: TextStyle(fontSize: 15),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            width: 150,
                            height: 25,
                            padding: EdgeInsets.only(right: 5, bottom: 1),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: invitation.status == 0
                                ? ElevatedButton(
                                    onPressed: () async {
                                      await dialog.onLoading(
                                          context, 'Đang xử lý');
                                      await _api.client.acceptInvitation(
                                          invitation.idStudent);
                                      dialog.showAlertDialog(
                                          context,
                                          'Thông báo',
                                          'Đã chấp nhận thành công');
                                      setState(() {
                                        fetch = _api.client.getInvitation();
                                      });
                                    },
                                    child: Center(child: Text('Chấp nhận')),
                                  )
                                : ElevatedButton(
                                    onPressed: null,
                                    child: Center(
                                        child: Text(invitation.status == 1
                                            ? 'Đã chấp nhận'
                                            : 'Chấp nhận')),
                                  )),
                        Container(
                          width: 90,
                          height: 25,
                          padding: EdgeInsets.only(right: 5, bottom: 1),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: invitation.status == 0
                              ? ElevatedButton(
                                  onPressed: () async {
                                    await dialog.onLoading(
                                        context, 'Đang xử lý');
                                    await _api.client
                                        .denyInvitation(invitation.idStudent);
                                    dialog.showAlertDialog(context, 'Thông báo',
                                        'Đã từ chối thành công');
                                    setState(() {
                                      fetch = _api.client.getInvitation();
                                    });
                                  },
                                  child: Center(child: Text('Từ chối')),
                                )
                              : ElevatedButton(
                                  onPressed: null,
                                  child: Center(
                                      child: Text(invitation.status == 2
                                          ? 'Đã từ chối'
                                          : 'Từ chối')),
                                ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
