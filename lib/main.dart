import 'package:db_proj/feats/auth/login_feat/login_view.dart';
import 'package:db_proj/feats/auth/register_feat/register_view.dart';
import 'package:db_proj/feats/launch_view.dart';
import 'package:db_proj/feats/notes_feat/home/home_view.dart';
import 'package:flutter/material.dart';

void main() {
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
      },
      initialRoute: "/launch_view",
    );
  }
}
