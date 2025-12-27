import 'package:db_proj/core/utils/helpers.dart';
import 'package:flutter/material.dart';

class LoginFuncs with Helpers{
  final TextEditingController _emailTextEditingController;
  final TextEditingController _passwordTextEditingController;
  BuildContext context;

  LoginFuncs(this.context, this._emailTextEditingController, this._passwordTextEditingController);


  void performLogin() {
    if(_checkData()){
      _login();
    }
  }

  bool _checkData() {
    if(_emailTextEditingController.text.isNotEmpty && _passwordTextEditingController.text.isNotEmpty) {
      return true;
    } else {
      showSnackBar(context: context, msg: "All fields are required", isSuccess: false);
      return false;
    }
  }

  void _login() {
    showSnackBar(context: context, msg: _emailTextEditingController.text);
  }


  //////////////////
  void gotoRegisterView() {
    Navigator.of(context).pushNamed("/register_view");
  }

}