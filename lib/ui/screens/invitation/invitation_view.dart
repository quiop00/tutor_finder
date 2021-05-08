import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tutor_finder_app/ui/screens/invitation/invitation_view_model.dart';

class InvitationView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _InvitationView();
  }
}

class _InvitationView extends State<InvitationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Mời dạy'),
          backgroundColor: Color.fromARGB(255, 49, 243, 208),
        ),
        body: ViewModelBuilder<InvitationViewModel>.reactive(
          viewModelBuilder: () => InvitationViewModel(),
          builder: (context, model, child) => SingleChildScrollView(
            child: Container(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    Positioned(
                        child: Container(
                      height: MediaQuery.of(context).size.height - 20,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                    )),
                    Positioned(
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.26,
                          color: Color.fromARGB(255, 49, 243, 208),
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
                                      image: NetworkImage(
                                          'https://manage-tutor-123.herokuapp.com/api/downloadFile/avatar_default.png'),
                                      fit: BoxFit.cover),
                                  border: new Border.all(
                                    color: Colors.white,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              Text(
                                'Mai Hoàng Đức',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ],
                          )),
                    ),
                    Positioned(
                        top: MediaQuery.of(context).size.height * 0.22,
                        left: MediaQuery.of(context).size.width * 0.08,
                        right: MediaQuery.of(context).size.width * 0.08,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          height: MediaQuery.of(context).size.height * 0.42,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.3), //color of shadow
                                spreadRadius: 2, //spread radius
                                blurRadius: 2, // blur radius
                                offset:
                                    Offset(0, 1), // changes position of shadow
                              ),
                            ],
                          ),
                        )),
                    Positioned(
                        top: MediaQuery.of(context).size.height *
                            (0.22 + 0.45) /
                            2,
                        left: MediaQuery.of(context).size.width * 0.26,
                        right: MediaQuery.of(context).size.width * 0.26,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 49, 243, 208),
                              onPrimary: Colors.white,
                            ),
                            onPressed: () {},
                            child: Text('Cho bản thân'))),
                    Positioned(
                      top: MediaQuery.of(context).size.height *
                              (0.22 + 0.45) /
                              2 +
                          30 * 2,
                      left: MediaQuery.of(context).size.width * 0.26,
                      right: MediaQuery.of(context).size.width * 0.26,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 49, 243, 208),
                            onPrimary: Colors.white,
                          ),
                          onPressed: () {},
                          child: Text('Cho lớp đang mở')),
                    )
                  ],
                ),
              ],
            )),
          ),
        ));
  }
}
