import 'package:db_proj/core/utils/helpers.dart';
import 'package:flutter/material.dart';

class NoteFuncs with Helpers{
  final TextEditingController _titleTextEditingController;
  final TextEditingController _infoTextEditingController;
  BuildContext context;

  NoteFuncs(this.context, this._titleTextEditingController, this._infoTextEditingController);


  void performSave() {
    if(_checkData()){
      _save();
    }
  }

  bool _checkData() {
    if(_titleTextEditingController.text.isNotEmpty && _infoTextEditingController.text.isNotEmpty) {
      return true;
    } else {
      showSnackBar(context: context, msg: "All fields are required", isSuccess: false);
      return false;
    }
  }

  void _save() {
    showSnackBar(context: context, msg: _titleTextEditingController.text);
  }


  //////////////////
  void gotoLoginView() {
    Navigator.of(context).pushNamed("/login_view");
  }

}