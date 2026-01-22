import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage()
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter App Bar")),
      body: const SizeBoxPage());
  }
}

class SizeBoxPage extends StatelessWidget {
  const SizeBoxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text("Hello Flutter One"),
        SizedBox(width: 10,),
        Text("Hello Flutter Two")
      ],
    );
  }
}