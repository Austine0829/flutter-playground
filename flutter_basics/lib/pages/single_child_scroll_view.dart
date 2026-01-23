import 'package:flutter/material.dart';

class SingleChildScrollViewPage extends StatelessWidget {
  const SingleChildScrollViewPage({super.key});

  @override 
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(10, (index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 100,
            color: Colors.blue,
            child: Text("Box ${index + 1}"),
          );
        })
      ),
    );
  }
}