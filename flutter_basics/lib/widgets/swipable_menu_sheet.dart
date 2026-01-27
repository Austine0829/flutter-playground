import 'package:flutter/material.dart';

class SwipableMenuSheetWidget extends StatelessWidget {
  const SwipableMenuSheetWidget({super.key});

  @override 
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
        builder: (context, scrollController) {
          return Container(
            padding: const EdgeInsets.all(12),
            child: ListView(
              controller: scrollController,
              children: const [
              SizedBox(height: 20),
              Text('More content...'),
            ]
          ),
        );
      }
    );
  }
}