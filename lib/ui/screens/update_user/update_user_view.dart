import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:tutor_finder_app/models/schedule_model.dart';
import 'package:tutor_finder_app/ui/screens/management/post_management_view.dart';
import 'package:tutor_finder_app/ui/screens/post/post_view_model.dart';
import 'package:tutor_finder_app/shared/dialog.dart' as dialog;
import 'package:tutor_finder_app/settings.dart' as setting;

import 'update_user_view_model.dart';

class UpdateView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _UpdateView();
  }
}

class _UpdateView extends State<UpdateView> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UpdateViewModel>.reactive(
        viewModelBuilder: () => UpdateViewModel(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                title: Text('Đổi mật khẩu'),
                backgroundColor: Color.fromARGB(255, 49, 243, 208),
              ),
              body: SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  child: Form(
                    key: _formKey,
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.topLeft,
                              child: Text("Đổi mật khẩu")),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              height: MediaQuery.of(context).size.height * 0.4,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(2),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey
                                        .withOpacity(0.3), //color of shadow
                                    spreadRadius: 2, //spread radius
                                    blurRadius: 2, // blur radius
                                    offset: Offset(
                                        0, 1), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  TextFormField(
                                    obscureText: model.isVisible,
                                    decoration: InputDecoration(
                                      hintText: 'Mật khẩu hiện tại',
                                      suffixIcon: InkWell(
                                        child: Icon(
                                            model.isVisible
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            color: Color.fromARGB(
                                                255, 49, 243, 208)),
                                        onTap: () {
                                          setState(() {
                                            model.isVisible = !model.isVisible;
                                          });
                                        },
                                      ),
                                    ),
                                    validator: (input) {
                                      if (input.length == 0) {
                                        return 'Enter your password';
                                        // ignore: missing_return
                                      }
                                      return null;
                                    },
                                    onSaved: (input) {
                                      model.password = input;
                                    },
                                  ),
                                  TextFormField(
                                    controller: pass,
                                    obscureText: model.isVisible,
                                    decoration: InputDecoration(
                                      hintText: 'Mật khẩu mới',
                                      suffixIcon: InkWell(
                                        child: Icon(
                                            model.isVisible
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            color: Color.fromARGB(
                                                255, 49, 243, 208)),
                                        onTap: () {
                                          setState(() {
                                            model.isVisible = !model.isVisible;
                                          });
                                        },
                                      ),
                                    ),
                                    validator: (input) {
                                      if (input.length == 0) {
                                        return 'Nhập mật khẩu mới';
                                        // ignore: missing_return
                                      }
                                      if (input.length < 6) {
                                        return 'Mật khẩu quá ngắn';
                                        // ignore: missing_return
                                      }
                                      return null;
                                    },
                                    onSaved: (input) {
                                      model.password = input;
                                    },
                                  ),
                                  TextFormField(
                                    obscureText: model.isVisible,
                                    decoration: InputDecoration(
                                      hintText: 'Nhập lại mật khẩu mới',
                                      suffixIcon: InkWell(
                                        child: Icon(
                                            model.isVisible
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            color: Color.fromARGB(
                                                255, 49, 243, 208)),
                                        onTap: () {
                                          setState(() {
                                            model.isVisible = !model.isVisible;
                                          });
                                        },
                                      ),
                                    ),
                                    validator: (input) {
                                      if (input != pass.text) {
                                        return 'Mật khẩu không khớp';
                                        // ignore: missing_return
                                      }
                                      return null;
                                    },
                                    onSaved: (input) {
                                      model.password = input;
                                    },
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if (!_formKey.currentState
                                              .validate()) {
                                            return;
                                          }
                                          _formKey.currentState.save();
                                        },
                                        child: Text('Đổi mật khẩu'),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
            ));
  }
}
