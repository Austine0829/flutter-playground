import 'package:flutter/material.dart';
import 'package:sqlite_basics_2/db/database_helper.dart';
import 'package:sqlite_basics_2/models/user.dart';

class UpdatePage extends StatefulWidget {
  final int id;

  const UpdatePage({super.key, required this.id});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage>{
  int? userId = 0;

  final _formkey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override 
  void initState() {
    super.initState();
    getUser(widget.id);
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> getUser(int id) async {
    final data = await DatabaseHelper.instance.getUser(id);
    
    if (data != null) {
      userId = data.id;
      _email.text = data.email;
      _password.text = data.password;
    }
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Update Page")),
      body: Padding(
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
                final updatedUser = User(
                  id: userId, 
                  email: _email.text, 
                  password: _password.text);

                await DatabaseHelper.instance.updateUser(
                  userId!, updatedUser.fromObjectToMap()
                );

                if (!mounted) return;
                  Navigator.pop(context, updatedUser);
              }, child: Text("Submit"))
            ],
          ) 
        )
      ) 
    );
  }
}