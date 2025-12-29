import 'package:db_proj/core/configs/shared_pref_configs.dart';
import 'package:db_proj/core/models/process_response.dart';
import 'package:db_proj/core/models/user.dart';
import 'package:db_proj/core/utils/helpers.dart';
import 'package:db_proj/feats/auth/auth_api_controller.dart';
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

  void _login() async{
    ProcessResponse processResponse = await AuthApiController().login(user);
    if(processResponse.isSuccess) {
      Navigator.of(context).pushNamed("/user_view");
    }
    showSnackBar(context: context,
        msg: processResponse.msg,
        isSuccess: processResponse.isSuccess);
  }


  //////////////////
  void gotoRegisterView() {
    Navigator.of(context).pushNamed("/register_view");
  }

  User get user {
    User user = User();
    user.email = _emailTextEditingController.text;
    user.password = _passwordTextEditingController.text;
    return user;
  }
}