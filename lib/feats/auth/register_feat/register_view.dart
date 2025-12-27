import 'package:db_proj/core/widgets/app_elevated_btn.dart';
import 'package:db_proj/core/widgets/app_text_field.dart';
import 'package:db_proj/feats/auth/register_feat/register_funcs.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late TextEditingController _emailTextEditingController;
  late TextEditingController _passwordTextEditingController;

  @override
  void initState() {
    super.initState();
    _emailTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailTextEditingController.dispose();
    _passwordTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          // AppLocalizations.of(context)!.login,
          "Register",
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
              Text("register",
                style: TextStyle(color: Color(0xFF18978F), fontSize: 28, fontWeight: FontWeight.bold),),
              Text("enter your email and password to register",
                style: TextStyle(color: Color(0xFF54BAB9), fontSize: 16, fontWeight: FontWeight.w300, height: 0.8),),
              SizedBox(height: 20),
              AppTextField(textEditingController: _emailTextEditingController, hintText: "enter email", iconData: Icons.email),
              SizedBox(height: 20),
              AppTextField(textEditingController: _passwordTextEditingController, hintText: "enter password", iconData: Icons.lock, obsecureText: true),
              SizedBox(height: 20),
              AppElevatedBtn(
                context: context,
                label: "Register!",
                onPressed: () => RegisterFuncs(context, _emailTextEditingController, _passwordTextEditingController).performRegister(),
              ),
            ]
        ),
      ),
    );
  }


}

