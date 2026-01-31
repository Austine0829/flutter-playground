import 'package:flutter/material.dart';
import 'package:sqlite_basics_2/db/database_helper.dart';
import 'package:sqlite_basics_2/pages/update_page.dart';

import '../models/user.dart';

class ReadPage extends StatefulWidget {
  const ReadPage({super.key});

  @override
  State<ReadPage> createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  List<User> users = [];

  @override 
  void initState() {
    super.initState();
    getAllUser();
  }

  Future<void> getAllUser() async {
    final data = await DatabaseHelper.instance.getAllUser();

    setState(() {
      users = data.map((user) => User.fromMapToObject(user)).toList();
    });
  }

  @override 
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (_, index) {
        return Row(
          children: [
            Text("Email: ${users[index].email}, \nPassword: ${users[index].password}"),
            TextButton(onPressed: () async {
              final updateduser = await Navigator.push<User>(
                context, 
                MaterialPageRoute(
                  builder: (_) => UpdatePage(id: users[index].id!)
                )
              );

              if (updateduser != null) {
                setState(() {
                  users[index] = updateduser;
                });
              }
            }, child: Text("Update")),
            TextButton(onPressed: () {
              DatabaseHelper.instance.deleteUser(users[index].id!);
              setState(() {
                getAllUser();
              });
            }, 
            child: Text("Delete"))
          ],
        );
    });
  }
}
