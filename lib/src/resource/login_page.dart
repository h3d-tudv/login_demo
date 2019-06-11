import 'package:flutter/material.dart';
import 'package:login_demo/src/blocs/login_bloc.dart';
import 'package:login_demo/src/resource/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc bloc = new LoginBloc();

  bool _showPass = false;
  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
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
              child: StreamBuilder(
                stream: bloc.userStream,
                builder: (context, snapshot) => TextField(
                controller: _userController,
                style: TextStyle(fontSize: 20, color: Colors.black),
                decoration: InputDecoration(
                    labelText: "UserName",
                    errorText: snapshot.hasError ? snapshot.error : null,
                    labelStyle: TextStyle(
                      color: Colors.black12,
                      fontSize: 18,
                    )),
              ),)
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: <Widget>[
                  StreamBuilder(
                    stream: bloc.pwdStream,
                    builder: (context, snapshot) => TextField(
                      controller: _passController,
                      obscureText: !_showPass,
                      style: TextStyle(fontSize: 20, color: Colors.black),
                      decoration: InputDecoration(
                          labelText: "Password",
                          errorText: snapshot.hasError ? snapshot.error : null,
                          labelStyle: TextStyle(
                            color: Colors.black12,
                            fontSize: 18,
                          )),
                    ),
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
    if (bloc.isValidInfo(_userController.text, _passController.text))
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
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