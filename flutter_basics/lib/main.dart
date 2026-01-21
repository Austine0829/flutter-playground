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
      body: const Center(
        child: ColumnTextWidget(textOne: "Austine", 
                             textTwo: "Audrey", 
                             textThree: "Tuazon"))
    );
  }
}

class ColumnTextWidget extends StatelessWidget {
  final String textOne;
  final String textTwo;
  final String textThree;

  const ColumnTextWidget({super.key, 
                       required this.textOne, 
                       required this.textTwo, 
                       required this.textThree});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text(textOne),
      Text(textTwo),
      Text(textThree)
    ]);
  }
}