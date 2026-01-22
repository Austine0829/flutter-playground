import 'package:flutter/material.dart';

class PaddingPage extends StatelessWidget {
  const PaddingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.only(
          top: 50,
          left: 50
        ),
        child: Text("Hello Flutter"),);
  }
}