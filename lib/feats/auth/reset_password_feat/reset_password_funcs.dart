import 'package:db_proj/core/configs/shared_pref_configs.dart';
import 'package:db_proj/core/models/process_response.dart';
import 'package:db_proj/core/models/user.dart';
import 'package:db_proj/core/utils/helpers.dart';
import 'package:db_proj/feats/auth/auth_api_controller.dart';
import 'package:flutter/material.dart';

class ResetPasswordFuncs with Helpers{
  final TextEditingController _passwordTextEditingController;
  final TextEditingController _passwordConfirmationTextEditingController;
  String _code = '';
  BuildContext context;

  ResetPasswordFuncs(this.context, this._passwordTextEditingController, this._passwordConfirmationTextEditingController);


  void performResetPassword() {
    if(_checkData()){
      _resetPassword();
    }
  }

  bool _checkPassword() {
    if (_passwordTextEditingController.text.isNotEmpty && _passwordConfirmationTextEditingController.text.isNotEmpty) {
      if (_passwordTextEditingController.text == _passwordConfirmationTextEditingController.text) {
        // showSnackBar(context: context, msg: "All fields are required", isSuccess: true);
        return true;
      }
      showSnackBar(context: context, msg: "password not match", isSuccess: false);
      return false;
    }
    showSnackBar(context: context, msg: "enter password and confirmation", isSuccess: false);
    return false;
  }

  bool _checkCode() {
    _code = _firstCodeController.text + _secondCodeController.text + _thirdCodeController.text + _fourthCodeController.text;
    if(_code.length == 4) {
      return true;
    }
    showSnackBar(context: context, msg: "code is not correct", isSuccess: false);
    return false;
  }

  bool _checkData() {
    return _checkCode() && _checkPassword() ;
  }

  void _resetPassword() async{
    ProcessResponse processResponse = await AuthApiController().resetPassword(
        code: _code,
        email: widget.email, ,
        password: _passwordTextEditingController.text
    );
    if(processResponse.isSuccess) {
      Navigator.of(context).pop();
    }
    showSnackBar(
        context: context,
        msg: processResponse.msg,
        isSuccess: processResponse.isSuccess);
  }





}