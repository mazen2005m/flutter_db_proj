import 'package:db_proj/core/models/process_response.dart';
import 'package:db_proj/core/utils/helpers.dart';
import 'package:db_proj/feats/auth/auth_api_controller.dart';
import 'package:flutter/material.dart';

class UserFuncs with Helpers {
  Future<void> userViewLogoutFunc(BuildContext context) async {
    ProcessResponse processResponse = await AuthApiController().logout();
    (processResponse.isSuccess)
        ? Navigator.of(context).pushReplacementNamed("/login_view")
        : showSnackBar(context: context, msg: processResponse.msg, isSuccess: false);
  }
}