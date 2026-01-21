import 'package:flutter/material.dart';

class ColumnTextWidget extends StatelessWidget {
  final String textOne;
  final String textTwo;
  final String textThree;

  const ColumnTextWidget({super.key, 
                       required this.textOne, 
                       required this.textTwo, 
                       required this.textThree});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text(textOne),
      Text(textTwo),
      Text(textThree)
    ]);
  }
}