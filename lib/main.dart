import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          constraints: BoxConstraints.expand(),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB( 0, 0, 0, 40),
                child: Container(
                  width: 70,
                    height: 70,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black12,
                    ),
                    child: FlutterLogo()
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Text("Hello\nWelcome back", style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black, fontSize: 30
                )
              ),),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: TextField(
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  decoration: InputDecoration(labelText: "UserName", labelStyle: TextStyle(color: Colors.black12, fontSize: 18, )),
                ),
              ),
              Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
                      child: TextField(
                      obscureText: true,
                      style: TextStyle(fontSize: 20, color: Colors.black),
                      decoration: InputDecoration(labelText: "Password", labelStyle: TextStyle(color: Colors.black12, fontSize: 18, )),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}