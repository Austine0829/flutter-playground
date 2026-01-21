import 'package:flutter/material.dart';

class RowTextWidget extends StatelessWidget {
  final String textOne;
  final String textTwo;
  final String textThree;

  const RowTextWidget({super.key, 
                       required this.textOne, 
                       required this.textTwo, 
                       required this.textThree});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text(textOne),
      Text(textTwo),
      Text(textThree)
    ]);
  }
}