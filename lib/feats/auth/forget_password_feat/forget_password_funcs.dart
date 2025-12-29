import 'package:db_proj/core/configs/shared_pref_configs.dart';
import 'package:db_proj/core/models/process_response.dart';
import 'package:db_proj/core/models/user.dart';
import 'package:db_proj/core/utils/helpers.dart';
import 'package:db_proj/feats/auth/auth_api_controller.dart';


import 'package:flutter/material.dart';
import '../reset_password_feat/reset_password_view.dart';

class ForgetPasswordFuncs with Helpers{
  final TextEditingController _emailTextEditingController;
  BuildContext context;

  ForgetPasswordFuncs(this.context, this._emailTextEditingController);


  void performForgetPassword() {
    if(_checkData()){
      _forgetPassword();
    }
  }

  bool _checkData() {
    if(_emailTextEditingController.text.isNotEmpty) {
      return true;
    } else {
      showSnackBar(context: context, msg: "All fields are required", isSuccess: false);
      return false;
    }
  }

  void _forgetPassword() async{
    ProcessResponse processResponse = await AuthApiController().forgetPassword(email: _emailTextEditingController.text);
    if(processResponse.isSuccess) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => ResetPasswordView(email: _emailTextEditingController.text),
        ),
      );
    }
    showSnackBar(context: context,
        msg: processResponse.msg,
        isSuccess: processResponse.isSuccess,
    );
  }


}