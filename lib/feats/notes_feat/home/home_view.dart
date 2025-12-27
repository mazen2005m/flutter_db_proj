import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoading = true;
    bool isNotEmptyList = true;

    return Scaffold(
      appBar: AppBar(
        title: Text("home"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.logout)
          ),
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.note_add)
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          ListTile(
            onTap: () {},
            leading: Icon(Icons.note),
            title: Text("note Title"),
            subtitle: Text("note info"),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete),),
          );
        }
      ),
    );
  }

}
