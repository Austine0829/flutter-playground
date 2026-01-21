import 'package:flutter/material.dart';
import '../widgets/text.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Flutter App"), 
        centerTitle: true,
        titleTextStyle: const TextStyle(color: Colors.red, fontSize: 22)),
      body: const MyTextWidget(text: "My Flutter App", )
    );
  }
}