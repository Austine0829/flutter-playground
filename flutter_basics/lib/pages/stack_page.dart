import 'package:flutter/material.dart';

class StackTextWidget extends StatelessWidget {
  final String textOne;
  final String textTwo;
  final String textThree;

  const StackTextWidget({super.key, 
                       required this.textOne, 
                       required this.textTwo, 
                       required this.textThree});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(width: 100, height: 50, color: Colors.red),
        Positioned(
          top: 15,
          left: 25,
          child: Text(textOne)),
        Positioned(child: Text(textTwo)),
        Positioned(
          top: 30,
          left: 50,
          child: Text(textThree))
      ],
    );
  }
}