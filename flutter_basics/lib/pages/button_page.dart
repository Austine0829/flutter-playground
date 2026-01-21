import 'package:flutter/material.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    // return ElevatedButton(
    //   onPressed: () { print("Button Clicked"); }, 
    //   child: const Text("Elevated Button"));
    // return TextButton(
    //   onPressed: () {print("Button  Clicked");}, 
    //   child: const Text("Text Button"));
    return OutlinedButton(
      onPressed: () {}, 
      child: const Text("Outlined Button"));
  }
}