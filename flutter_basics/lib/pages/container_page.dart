import 'package:flutter/material.dart';


class ContainerPage extends StatelessWidget {
  const ContainerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child:  Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(32),
      width: 200,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.pink, width: 2)
      ),
      child: const Center(
        child: Text("Hello, I'm Container", 
        style: TextStyle(color: Colors.white, fontSize: 12))
        ),
      )
    );
  }
}