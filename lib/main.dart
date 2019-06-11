import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_demo/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPass = false;
  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  var _userNameErr = "Tài khoản không hợp lệ";
  var _passErr = "Mật khẩu phải trên 6 kí tự";
  var _userInvalid = false;
  var _passInvalid = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Container(
                  width: 70,
                  height: 70,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black12,
                  ),
                  child: FlutterLogo()),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Text("Hello\nWelcome back",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 30)),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: TextField(
                controller: _userController,
                style: TextStyle(fontSize: 20, color: Colors.black),
                decoration: InputDecoration(
                    labelText: "UserName",
                    errorText: _userInvalid ? _userNameErr : null,
                    labelStyle: TextStyle(
                      color: Colors.black12,
                      fontSize: 18,
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: <Widget>[
                  TextField(
                    controller: _passController,
                    obscureText: !_showPass,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    decoration: InputDecoration(
                        labelText: "Password",
                        errorText: _passInvalid ? _passErr : null,
                        labelStyle: TextStyle(
                          color: Colors.black12,
                          fontSize: 18,
                        )),
                  ),
                  GestureDetector(
                    onTap: onToggleShowPass,
                    child: Text(
                      _showPass ? "HIDE" : "SHOW",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: RaisedButton(
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                onPressed: onSignInClicked,
                child: Text(
                  "SIGN IN",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Container(
                  height: 100,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("NEW USER? SIGN UP",
                          style:
                          TextStyle(color: Colors.black12, fontSize: 15)),
                      Text("FORGOT PASSWORD?",
                          style: TextStyle(color: Colors.blue, fontSize: 15)),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }

  void onSignInClicked() {
    setState(() {
      if (_userController.text.length < 6 || !_userController.text.contains("@"))
        _userInvalid = true;
      else
        _userInvalid = false;

      if (_passController.text.length < 6)
        _passInvalid = true;
      else
        _passInvalid = false;

      if (_userInvalid == false && _passInvalid == false) {
        //vào màn hình home
        //Navigator.push(context, MaterialPageRoute(builder: gotoHome));
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    });
  }

  Widget gotoHome(BuildContext context) {
    return HomePage();
  }

  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }
}
