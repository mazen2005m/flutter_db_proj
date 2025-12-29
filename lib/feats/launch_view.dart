import 'package:db_proj/core/configs/shared_pref_configs.dart';
import 'package:flutter/material.dart';

class LaunchView extends StatefulWidget {
  const LaunchView({super.key});

  @override
  State<LaunchView> createState() => _LaunchViewState();
}

class _LaunchViewState extends State<LaunchView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), (){
      String route = SharedPrefConfigs().isLoggedIn? "/user_view" : "/login_view";
      Navigator.of(context).pushReplacementNamed(route);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors:[Colors.red, Colors.green, Colors.blue, Colors.yellow],
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
        ),
      ),
      child: Text("DATA APP"),
    );
  }
}
