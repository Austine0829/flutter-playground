import 'package:flutter/material.dart';
import 'package:flutter_basics/widgets/tile.dart';

class HorizontalScrollTileHolderWidget extends StatelessWidget {
  const HorizontalScrollTileHolderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const TileWidget();
        }, 
        separatorBuilder: (_, __) => const SizedBox(width: 8), 
        itemCount: 5
      ),
    );
  }
}