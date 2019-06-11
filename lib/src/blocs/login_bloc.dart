import 'dart:async';

import 'package:login_demo/src/validators/validations.dart';

class LoginBloc {
  StreamController _userController = new StreamController();
  StreamController _passController = new StreamController();

  Stream get userStream => _userController.stream;
  Stream get pwdStream => _passController.stream;

  bool isValidInfo(String userName, String pwd) {
    if (!Validations.isValidUser(userName)) {
      _userController.sink.addError("Tài khoản không hợp lệ");
      return false;
    }
    _userController.sink.add("OK");

    if (!Validations.isValidPass(pwd)) {
      _passController.sink.addError("Mật khẩu phải trên 6 kí tự");
      return false;
    }

    _passController.sink.add("OK");
    return true;
  }

  void dispose() {
    _userController.close();
    _passController.close();
  }
}