import 'package:flutter/material.dart';
import '../models/user.dart';

class ModelsPage extends StatelessWidget {
  const ModelsPage({super.key});
  static User user = User(id: 1, email: "hello@world.web", password: "Admin");

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: ListView(
        children: [
          Center(child: Text("ID: ${user.id}")),
          Center(child: Text("Email: ${user.email}")),
          Center(child: Text("Password: ${user.password}"))
        ]
      )
    );
  }
}