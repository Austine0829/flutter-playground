import 'package:flutter/material.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({super.key});

  @override 
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(title: Text("Title 1")),
          ListTile(title: Text("Title 2")),
          ListTile(title: Text("Title 3")),
          ListTile(title: Text("Title 4"))
        ],
      );
  }
}
