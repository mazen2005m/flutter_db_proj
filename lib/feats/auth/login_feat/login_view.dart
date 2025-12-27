import 'package:db_proj/core/utils/helpers.dart';
import 'package:db_proj/core/widgets/app_elevated_btn.dart';
import 'package:db_proj/core/widgets/app_text_field.dart';
import 'package:db_proj/feats/auth/login_feat/login_funcs.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with Helpers{
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
    LoginFuncs _loginFuncs = LoginFuncs(context, _emailTextEditingController, _passwordTextEditingController);
    return Scaffold(
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
              "Login",
              style: TextStyle(color: Color(0xFF18978F), fontSize: 28, fontWeight: FontWeight.bold),),
            Text(
              "enter your email and password to login",
              style: TextStyle(color: Color(0xFF54BAB9), fontSize: 16, fontWeight: FontWeight.w300, height: 0.8),),
            SizedBox(height: 20),
            AppTextField(textEditingController: _emailTextEditingController, hintText: "enter email", iconData: Icons.email),
            SizedBox(height: 20),
            AppTextField(textEditingController: _passwordTextEditingController, hintText: "enter password", iconData: Icons.lock, obsecureText: true),
            SizedBox(height: 20),
            AppElevatedBtn(
                context: context,
                label: "Login!",
                onPressed: () => _loginFuncs.performLogin(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("you don't have one? "),
                TextButton(
                    onPressed: () => _loginFuncs.gotoRegisterView(),
                    child: Text(
                        "Register",
                      // style: GoogleFonts.nunito(
                      //   fontWeight: FontWeight.bold,
                      //   decoration: TextDecoration.underline,
                      //   decorationThickness: 2,
                      // ),
                    ),
                ),
              ],
            ),
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Color(0xFF18978F),
        child: Icon(Icons.language),
      ),
    );
  }


}


