import 'package:flutter/material.dart';

class TileWidget extends StatelessWidget {
  const TileWidget({super.key});

  @override 
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                image: AssetImage(
                  "assets/naruto.jpeg"
                ),
              fit: BoxFit.cover
            )
          )
        ),
      const Text(
        "Anime",
        style: TextStyle(
          color: Colors.white54
          )
        ),
      const Text(
        "Naruto",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white
        )
      )
    ]);
  }
}