import 'package:db_proj/core/utils/helpers.dart';
import 'package:db_proj/core/widgets/app_confirm_text_field.dart';
import 'package:db_proj/core/widgets/app_elevated_btn.dart';
import 'package:db_proj/core/widgets/app_text_field.dart';
import 'package:db_proj/feats/auth/reset_password_feat/reset_password_funcs.dart';
import 'package:flutter/material.dart';

class ResetPasswordView extends StatefulWidget {
  final String email;
  const ResetPasswordView({super.key, required this.email});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> with Helpers{
  late TextEditingController _passwordTextEditingController;
  late TextEditingController _passwordConfirmationTextEditingController;

  late TextEditingController _firstCodeTextEditingController;
  late TextEditingController _secondCodeTextEditingController;
  late TextEditingController _thirdCodeTextEditingController;
  late TextEditingController _fourthCodeTextEditingController;

  late FocusNode _firstCodeFocusNode;
  late FocusNode _secondCodeFocusNode;
  late FocusNode _thirdCodeFocusNode;
  late FocusNode _fourthCodeFocusNode;




  @override
  void initState() {
    super.initState();
    _passwordTextEditingController = TextEditingController();
    _passwordConfirmationTextEditingController = TextEditingController();

    _firstCodeTextEditingController = TextEditingController();
    _secondCodeTextEditingController = TextEditingController();
    _thirdCodeTextEditingController = TextEditingController();
    _fourthCodeTextEditingController = TextEditingController();

    _firstCodeFocusNode = FocusNode();
    _secondCodeFocusNode = FocusNode();
    _thirdCodeFocusNode = FocusNode();
    _fourthCodeFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _passwordTextEditingController.dispose();
    _passwordConfirmationTextEditingController.dispose();

    _firstCodeTextEditingController.dispose();
    _secondCodeTextEditingController.dispose();
    _thirdCodeTextEditingController.dispose();
    _fourthCodeTextEditingController.dispose();

    _firstCodeFocusNode.dispose();
    _secondCodeFocusNode.dispose();
    _thirdCodeFocusNode.dispose();
    _fourthCodeFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ResetPasswordFuncs _ResetPasswordFuncs = ResetPasswordFuncs(
        context,_passwordTextEditingController,
        _passwordConfirmationTextEditingController);
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          // AppLocalizations.of(context)!.ResetPassword,
          "Reset Password",
          // style: GoogleFonts.nunito(
          //   color: Color(0xFF18978F),
          //   fontWeight: FontWeight.bold,
          // ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Reset Password",
              style: TextStyle(color: Color(0xFF18978F), fontSize: 28, fontWeight: FontWeight.bold),),
            Text(
              "enter code and new password",
              style: TextStyle(color: Color(0xFF54BAB9), fontSize: 16, fontWeight: FontWeight.w300, height: 0.8),),
            SizedBox(height: 20),
            Row(
              children: [
                AppConfirmTextField(
                    textEditingController: _firstCodeTextEditingController,
                    focusNode: _firstCodeFocusNode, hintText: '',
                    onChanged: (String val){
                      if (val.isNotEmpty) _secondCodeFocusNode.requestFocus();
                    },
                    onSubmitted: (String val){},
                ),
                SizedBox(width: 10,),
                AppConfirmTextField(
                  textEditingController: _secondCodeTextEditingController,
                  focusNode: _secondCodeFocusNode, hintText: '',
                  onChanged: (String val){
                    (val.isNotEmpty)
                        ? _thirdCodeFocusNode.requestFocus()
                        : _firstCodeFocusNode.requestFocus();
                  },
                  onSubmitted: (String val){},
                ),
                SizedBox(width: 10,),
                AppConfirmTextField(
                  textEditingController: _thirdCodeTextEditingController,
                  focusNode: _thirdCodeFocusNode, hintText: '',
                  onChanged: (String val){
                    (val.isNotEmpty)
                        ? _fourthCodeFocusNode.requestFocus()
                        : _thirdCodeFocusNode.requestFocus();
                  },
                  onSubmitted: (String val){},
                ),
                SizedBox(width: 10,),
                AppConfirmTextField(
                  textEditingController: _fourthCodeTextEditingController,
                  focusNode: _fourthCodeFocusNode, hintText: '',
                  onChanged: (String val){
                   if (val.isEmpty) _thirdCodeFocusNode.requestFocus();
                  },
                  onSubmitted: (String val){},
                ),
              ]
            ),
            SizedBox(height: 20),
            AppTextField(textEditingController: _passwordTextEditingController, hintText: "enter new password", iconData: Icons.email),
            SizedBox(height: 20),
            AppTextField(textEditingController: _passwordConfirmationTextEditingController, hintText: "confirm password", iconData: Icons.lock, obsecureText: true),
            SizedBox(height: 20),
            AppElevatedBtn(
                context: context,
                label: "Reset Password!",
                onPressed: () => _ResetPasswordFuncs.performResetPassword(),
            ),

          ]
        ),
      ),

    );
  }


}


