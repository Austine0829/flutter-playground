import 'package:flutter/material.dart';

// Stateful Widget
class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int count = 0;

  void increment() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Counter: $count"),
        ElevatedButton(
          onPressed: increment, 
          child: const Text("Press To Increment", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue)))
      ],
    );
  }
}