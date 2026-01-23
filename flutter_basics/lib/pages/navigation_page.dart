import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("First Page")),
      body: Center(
        child: 
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (_) => const SecondPage(message: "Hello!")));
          },
          child: const Text("Go to Second")))
    );
  }
}

class SecondPage extends StatelessWidget {
  final String message;

  const SecondPage({super.key, required this.message});

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Page: $message")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Go Back To First Page"),
        ))
    );
  }
}