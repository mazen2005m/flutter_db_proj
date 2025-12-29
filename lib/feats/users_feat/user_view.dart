import 'package:db_proj/core/models/process_response.dart';
import 'package:db_proj/core/utils/helpers.dart';
import 'package:db_proj/feats/auth/auth_api_controller.dart';
import 'package:db_proj/feats/users_feat/user_api_controller.dart';
import 'package:db_proj/feats/users_feat/user_funcs.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget with Helpers {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoading = true;
    bool isNotEmptyList = true;

    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("home"),
        actions: [
          IconButton(
              onPressed: () async => await UserFuncs().userViewLogoutFunc(context),
              icon: Icon(Icons.logout)
          ),
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.note_add)
          ),
        ],
      ),
      body: FutureBuilder(
        future: UserApiController().getAllUsers(),
        builder: (context, asyncSnapshot) {
          if(asyncSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          else if(asyncSnapshot.hasData && asyncSnapshot.data!.isNotEmpty) {
            return ListView.builder(
              itemCount: asyncSnapshot.data!.length,
              itemBuilder: (context, index) {
                ListTile(
                  onTap: () {},
                  leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(asyncSnapshot.data![index].image),
                  ),
                  title: Text(asyncSnapshot.data![index].name),
                  subtitle: Text(asyncSnapshot.data![index].email),
                  // trailing: IconButton(
                  //   onPressed: () {},
                  //   icon: Icon(Icons.delete),
                  // ),
                );
              }
            );
          }
          else{
            return Center(
                child: Text("no data",
                  // style: GoogleFonts.montserrat(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.grey.shade700),
                ),
            );
          }
        }
      ),
    );
  }



}
