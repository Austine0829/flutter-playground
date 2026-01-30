import 'package:flutter/material.dart';

class TextFieldPage extends StatefulWidget {
  const TextFieldPage({super.key});

  @override
  State<TextFieldPage> createState() => _TextFieldsPageState();
}

class _TextFieldsPageState extends State<TextFieldPage> {
  String _text = "";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            top: 25,
            left: 12,
            right: 12
          ),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              TextField(
              decoration: InputDecoration(
                label: Text("Name"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12)
                )
              ),
              onChanged: (value) {
                setState(() {
                  _text = value;
                });
              },
            ),
            Text("_text Variable State: $_text")]
          )
        ) 
      ) 
    );
  }
}