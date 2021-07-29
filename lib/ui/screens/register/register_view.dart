import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stacked/stacked.dart';
import 'package:tutor_finder_app/ui/screens/register/register_view_model.dart';
import 'package:tutor_finder_app/shared/dialog.dart' as dialog;

class RegisterView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterView();
  }
}

class _RegisterView extends State<RegisterView> {
  TextEditingController usernameController;
  TextEditingController emailController;
  TextEditingController phoneNumberController;
  TextEditingController passwordController;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var color = Color.fromARGB(255, 49, 243, 208);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneNumberController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đăng ký'),
        backgroundColor: Color.fromARGB(255, 49, 243, 208),
      ),
      body: SingleChildScrollView(
          child: ViewModelBuilder<RegisterViewModel>.reactive(
        viewModelBuilder: () => RegisterViewModel(),
        builder: (context, model, child) => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      padding: EdgeInsets.only(top: 10),
                      color: Color.fromARGB(255, 49, 243, 208),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.12,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Đang tạo tài khoản cho ${model.isStudent ? 'Học viên' : 'Gia sư'}',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      top: MediaQuery.of(context).size.height * 0.06 / 2,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.18,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  model.isStudent = true;
                                });
                                model.roles[0] = "student";
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.22,
                                height:
                                    MediaQuery.of(context).size.width * 0.22,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                  border: Border.all(
                                      color: model.isStudent
                                          ? Colors.green
                                          : Colors.white,
                                      width: 1),
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.emoji_people_outlined, size: 20),
                                    Text(
                                      'Học viên',
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  model.isStudent = false;
                                });
                                model.roles[0] = "tutor";
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.22,
                                height:
                                    MediaQuery.of(context).size.width * 0.22,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                  border: Border.all(
                                      color: model.isStudent
                                          ? Colors.white
                                          : Colors.green,
                                      width: 1),
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.school, size: 20),
                                    Text(
                                      'Gia sư',
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.68,
              padding: EdgeInsets.only(left: 18, right: 18),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextFormField(
                      // controller: usernameController,
                      decoration: InputDecoration(
                          hintText: 'Tên người dùng',
                          suffixIcon: Icon(
                            Icons.person_outline,
                            color: color,
                          )),
                      validator: (input) {
                        if (input.length == 0) {
                          return 'Nhập tên người dùng';
                          // ignore: missing_return
                        }
                        return null;
                      },
                      onSaved: (input) {
                        model.registerBody.username = input;
                      },
                    ),
                    TextFormField(
                      // controller: emailController,
                      decoration: InputDecoration(
                          hintText: 'Email',
                          suffixIcon: Icon(Icons.email, color: color)),
                      keyboardType: TextInputType.emailAddress,
                      validator: (input) {
                        if (input.length == 0) {
                          return 'Nhập email';
                          // ignore: missing_return
                        } else if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(input)) {
                          return 'Email không hợp lệ';
                        }
                        return null;
                      },
                      onSaved: (input) {
                        model.registerBody.email = input;
                      },
                    ),
                    TextFormField(
                      // controller: phoneNumberController,
                      decoration: InputDecoration(
                          hintText: 'Số điện thoại',
                          suffixIcon: Icon(Icons.phone_android, color: color)),
                      keyboardType: TextInputType.phone,
                      validator: (input) {
                        if (input.length == 0) {
                          return 'Nhập số điện thoại';
                          // ignore: missing_return
                        }
                        return null;
                      },
                      onSaved: (input) {
                        model.registerBody.phoneNumber = input;
                      },
                    ),
                    TextFormField(
                      // controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: model.isVisible,
                      decoration: InputDecoration(
                          hintText: 'Mật khẩu',
                          suffixIcon: InkWell(
                            child: Icon(
                                model.isVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: color),
                            onTap: () {
                              setState(() {
                                model.isVisible = !model.isVisible;
                              });
                            },
                          ),
                          helperText: '*Mật khẩu bắt buộc có ít nhất 6 ký tự'),
                      validator: (input) {
                        if (input.length == 0) {
                          return 'Nhập mật khẩu';
                          // ignore: missing_return
                        } else if (input.length < 6) {
                          return 'Mật khẩu quá ngắn';
                        }
                        return null;
                      },
                      onSaved: (input) {
                        model.registerBody.password = input;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Radio(
                            value: true,
                            groupValue: model.isAccept,
                            toggleable: true,
                            onChanged: (value) {
                              setState(() {
                                model.isAccept = value;
                              });
                              model.isAccept = value;
                              model.isAccept = model.isAccept ?? false;
                              print(model.isAccept);
                            },
                          ),
                          Flexible(
                              child: Text(
                            'Tôi đồng ý với chính sách và điều khoản của CNPM',
                            maxLines: 3,
                          ))
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 49, 243, 208),
                        onPrimary: Colors.white,
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Center(
                          child: Text(
                            'Đăng ký',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                      ),
                      onPressed: model.isAccept
                          ? () async {
                              if (!_formKey.currentState.validate()) {
                                return;
                              }
                              _formKey.currentState.save();
                              await model.register();
                              dialog.showAlertDialog(
                                  context, 'Thông báo', model.message);
                              if (model.status)
                                Timer timer = Timer(
                                    const Duration(milliseconds: 800), () {
                                  Navigator.pushReplacementNamed(
                                      context, '/login');
                                });
                            }
                          : null,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Visibility(
                        visible: model.isBusy,
                        child: SpinKitCircle(
                          color: Colors.redAccent,
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
