import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stacked/stacked.dart';
import 'package:tutor_finder_app/services/body/login_body.dart';
import 'package:tutor_finder_app/ui/screens/login/login_view_model.dart';
import 'package:tutor_finder_app/shared/dialog.dart' as dialog;

class LoginView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginView();
  }
}

class _LoginView extends State<LoginView> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đăng nhập'),
        backgroundColor: Color.fromARGB(255, 49, 243, 208),
      ),
      body: ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        onModelReady: (model) {},
        builder: (context, model, child) {
          return SingleChildScrollView(
            child: Stack(
              children: [
                Positioned(
                    child: Container(
                  height: MediaQuery.of(context).size.height - 20,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                )),
                Positioned(
                  top: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.width,
                    color: Color.fromARGB(255, 49, 243, 208),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'CNPM8',
                          style: TextStyle(fontSize: 35, color: Colors.white),
                        ),
                        Text(
                          'chia sẻ tri thức - xây dựng tương lai',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                    top: MediaQuery.of(context).size.height * 0.28,
                    left: 20,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      width: MediaQuery.of(context).size.width - 40,
                      height: MediaQuery.of(context).size.height * 0.28,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 1),
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 2)
                          ]),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _usernameController,
                              decoration: InputDecoration(
                                  hintText: 'Tên người dùng',
                                  suffixIcon: Icon(
                                    Icons.email_outlined,
                                    color: Color.fromARGB(255, 49, 243, 208),
                                  )),
                              validator: (input) {
                                if (input.length == 0) {
                                  return 'Cần nhập tên đăng nhập';
                                  // ignore: missing_return
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: _passwordController,
                              obscureText: model.isVisible,
                              decoration: InputDecoration(
                                hintText: 'Mật khẩu',
                                suffixIcon: InkWell(
                                  child: Icon(
                                      model.isVisible
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Color.fromARGB(255, 49, 243, 208)),
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
                            )
                          ],
                        ),
                      ),
                    )),
                Positioned(
                  top:
                      MediaQuery.of(context).size.height * (0.28 + 0.28) * 0.95,
                  left: MediaQuery.of(context).size.width * 0.25,
                  child: ElevatedButton(
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
                        'Đăng nhập',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      )),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                      }
                      if (_usernameController.text.isEmpty ||
                          _passwordController.text.isEmpty) {
                        return;
                      }
                      LoginBody loginBody = LoginBody();
                      loginBody.username = _usernameController.text;
                      loginBody.password = _passwordController.text;

                      await model.checkLogin(loginBody);
                      if (model.status) {
                        Navigator.pushReplacementNamed(context, '/home');
                      } else {
                        dialog.showAlertDialog(
                            context, "Lỗi đăng nhập", model.errorMessage);
                      }
                    },
                  ),
                ),
                Positioned(
                    top: MediaQuery.of(context).size.height *
                            (0.28 + 0.28) *
                            0.95 +
                        60,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text('Hoặc',
                            style:
                                TextStyle(fontSize: 15, color: Colors.black54)),
                      ),
                    )),
                Positioned(
                  top: MediaQuery.of(context).size.height *
                          (0.28 + 0.28) *
                          0.95 +
                      80,
                  left: MediaQuery.of(context).size.width * 0.25,
                  child: ElevatedButton(
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
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                  ),
                ),
                Positioned(
                    top: MediaQuery.of(context).size.height * 0.38,
                    left: MediaQuery.of(context).size.width * 0.44,
                    child: Visibility(
                        visible: model.isBusy,
                        child: SpinKitCircle(
                          color: Colors.redAccent,
                        )))
              ],
            ),
          );
        },
      ),
    );
  }
}
