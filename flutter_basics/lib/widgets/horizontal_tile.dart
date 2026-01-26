import 'package:flutter/material.dart';

class HorizontalTileWidget extends StatelessWidget {
  const HorizontalTileWidget({super.key});

  @override 
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 45,
          width: 45,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                image: AssetImage("assets/naruto.jpeg"),
                  fit: BoxFit.cover
                )
              ),
            )
          ),
        const SizedBox(width: 5),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Column(children: [
            Text("Naruto", style: TextStyle(color: Colors.white)),
            Text("Anime", style: TextStyle(color: Colors.white54))
        ])
      ),
      const Spacer(),
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert, color: Colors.white))
    ]);
  }
}