import 'package:flutter/material.dart';
import '../utils/app_text_theme.dart';

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
      Text("Anime",style: Theme.of(context).textTheme.tileGenre),
      Text("Naruto",style: Theme.of(context).textTheme.verticalTileTitle)
    ]);
  }
}