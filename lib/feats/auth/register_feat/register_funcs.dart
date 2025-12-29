import 'package:db_proj/core/configs/api_configs.dart';
import 'package:db_proj/core/configs/shared_pref_configs.dart';
import 'package:db_proj/core/models/process_response.dart';
import 'package:db_proj/core/models/user.dart';
import 'package:db_proj/core/utils/helpers.dart';
import 'package:db_proj/feats/auth/auth_api_controller.dart';
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

  void _register() async {
    ProcessResponse processResponse = await AuthApiController().register(user);
    if(processResponse.isSuccess){
      // SharedPrefConfigs().saveUser(user: user);
      Navigator.pop(context);
    }
    showSnackBar(context: context, msg: processResponse.msg, isSuccess: processResponse.isSuccess);
  }

  //////////////////
  void gotoRegisterView() {
    Navigator.of(context).pushNamed("/register_view");
  }

  User get user {
    User user = User();
      user.email = _emailTextEditingController.text;
      user.password = _emailTextEditingController.text;
    return user;
  }

}