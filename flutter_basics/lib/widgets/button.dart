import 'package:flutter/material.dart';

class ButtonCounterPage extends StatefulWidget {
  const ButtonCounterPage({super.key});

  @override 
  State<ButtonCounterPage> createState() => _ButtonCounterPageState();
}

class _ButtonCounterPageState extends State<ButtonCounterPage> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
    });
  }

  @override 
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          Text("Counter: $counter"),
          ElevatedButton(
          onPressed: increment,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6)
            )
          ),
          child: const Text("Click Me!"),),
        ],));
  }
}