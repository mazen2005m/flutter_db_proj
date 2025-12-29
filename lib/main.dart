import 'package:db_proj/core/configs/shared_pref_configs.dart';
import 'package:db_proj/feats/auth/forget_password_feat/forget_password_view.dart';
import 'package:db_proj/feats/auth/login_feat/login_view.dart';
import 'package:db_proj/feats/auth/register_feat/register_view.dart';
import 'package:db_proj/feats/auth/reset_password_feat/reset_password_view.dart';
import 'package:db_proj/feats/launch_view.dart';
import 'package:db_proj/feats/notes_feat/home/home_view.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefConfigs().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/launch_view": (context) => LaunchView(),
        "/home_view": (context) => HomeView(),
        "/register_view": (context) => RegisterView(),
        "/login_view": (context) => LoginView(),
        "/forget_password_view": (context) => ForgetPasswordView(),
        // "/reset_password_view": (context) => ResetPasswordView(),
      },
      initialRoute: "/launch_view",
    );
  }
}
