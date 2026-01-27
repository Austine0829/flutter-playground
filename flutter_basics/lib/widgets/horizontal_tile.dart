import 'package:flutter/material.dart';
import 'package:flutter_basics/utils/app_text_theme.dart';
import 'package:flutter_basics/widgets/swipable_menu_sheet.dart';

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
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(children: [
            Text("Naruto", style: Theme.of(context).textTheme.horizontalTileTitle),
            Text("Anime", style: Theme.of(context).textTheme.tileGenre)
        ])
      ),
      const Spacer(),
      IconButton(
        onPressed: () {
          showModalBottomSheet(
            context: context, 
            showDragHandle: true,
            builder: (context) {
              return const SwipableMenuSheetWidget();
          });
        },
        icon: const Icon(Icons.more_vert, color: Colors.white))
    ]);
  }
}