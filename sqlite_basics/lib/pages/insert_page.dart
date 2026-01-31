import 'package:flutter/material.dart';
import 'package:sqlite_basics_2/db/database_helper.dart';
import 'package:sqlite_basics_2/models/user.dart';

class InsertPage extends StatefulWidget {
  const InsertPage({super.key});

  @override
  State<InsertPage> createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage>{
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override 
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            TextFormField(
              controller: _email,
              decoration: InputDecoration(
                hintText: "sqlite@email.domain",
                border: OutlineInputBorder()
              ),
            ),
            Divider(),
            TextFormField(
              controller: _password,
              decoration: InputDecoration(
                hintText: "***************",
                border: OutlineInputBorder()
              ),
            ),
            Divider(),
            ElevatedButton(onPressed: () async {
              await DatabaseHelper.instance.insertUser(
                User(email: _email.text, password: _password.text).fromObjectToMap());

              setState(() {
                _email.text = "";
                _password.text = "";
              });
            }, child: Text("Submit"))
          ],
        ) 
      )
    );
  }
}