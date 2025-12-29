import 'package:db_proj/core/utils/helpers.dart';
import 'package:db_proj/core/widgets/app_elevated_btn.dart';
import 'package:db_proj/core/widgets/app_text_field.dart';
import 'package:db_proj/feats/auth/forget_password_feat/forget_password_funcs.dart';
import 'package:db_proj/feats/auth/login_feat/login_funcs.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> with Helpers{
  late TextEditingController _emailTextEditingController;

  @override
  void initState() {
    super.initState();
    _emailTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ForgetPasswordFuncs _forgetPasswordFuncs = ForgetPasswordFuncs(context, _emailTextEditingController);
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          // AppLocalizations.of(context)!.login,
          "login",
          // style: GoogleFonts.nunito(
          //   color: Color(0xFF18978F),
          //   fontWeight: FontWeight.bold,
          // ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "forget password",
              style: TextStyle(color: Color(0xFF18978F), fontSize: 28, fontWeight: FontWeight.bold),),
            Text(
              "enter your email to reset your password",
              style: TextStyle(color: Color(0xFF54BAB9), fontSize: 16, fontWeight: FontWeight.w300, height: 0.8),),
            SizedBox(height: 20),
            AppTextField(textEditingController: _emailTextEditingController, hintText: "enter email", iconData: Icons.email),
            SizedBox(height: 20),
            AppElevatedBtn(
                context: context,
                label: "send!",
                onPressed: () => _forgetPasswordFuncs.performForgetPassword(),
            ),
          ]
        ),
      ),
    );
  }


}


