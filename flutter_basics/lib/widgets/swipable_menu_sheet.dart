import 'package:flutter/material.dart';

class SwipableMenuSheetWidget extends StatelessWidget {
  const SwipableMenuSheetWidget({super.key});

  @override 
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        expand: false,
        initialChildSize: 1,
        builder: (context, scrollController) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 25
            ),
            child: ListView(
              controller: scrollController,
              children: const [
              Text('More content...'),
            ]
          ),
        );
      }
    );
  }
}