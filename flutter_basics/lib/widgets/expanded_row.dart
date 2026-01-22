import 'package:flutter/material.dart';

class ExpandedRowWidget extends StatelessWidget {
  const ExpandedRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Container(color: Colors.red)),
        Container(color: Colors.blue, width: 100,)
      ]
    );
  }
}