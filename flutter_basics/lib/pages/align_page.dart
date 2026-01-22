import 'package:flutter/material.dart';

class AlignPage extends StatelessWidget {
  const AlignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
        alignment: Alignment.topRight,
        child: Text("Flutter App"));
  }
}