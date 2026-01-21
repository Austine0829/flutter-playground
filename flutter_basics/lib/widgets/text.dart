import 'package:flutter/material.dart';

// Stateless Widget
class MyTextWidget extends StatelessWidget {
  final String text;

  const MyTextWidget({super.key, required this.text });

  @override 
  Widget build(BuildContext context) {
    return Text(
      text, 
      style: const TextStyle(fontSize: 20));
  }
}