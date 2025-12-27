import 'package:db_proj/core/utils/helpers.dart';
import 'package:flutter/material.dart';

class RegisterFuncs with Helpers{
  final TextEditingController _emailTextEditingController;
  final TextEditingController _passwordTextEditingController;
  BuildContext context;

  RegisterFuncs(this.context, this._emailTextEditingController, this._passwordTextEditingController);


  void performRegister() {
    if(_checkData()){
      _register();
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

  void _register() {
    showSnackBar(context: context, msg: _emailTextEditingController.text);
  }


  //////////////////
  void gotoRegisterView() {
    Navigator.of(context).pushNamed("/register_view");
  }

}