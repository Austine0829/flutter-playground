import 'package:flutter/material.dart';

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