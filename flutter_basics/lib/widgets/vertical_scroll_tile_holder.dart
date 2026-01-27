import 'package:flutter/material.dart';
import 'package:flutter_basics/widgets/horizontal_tile.dart';


class VerticalScrollTileHolderWidget extends StatelessWidget {
  const VerticalScrollTileHolderWidget({super.key});

  @override 
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
        ...List.generate(5, (index) => const Padding(
            padding: EdgeInsets.only(bottom: 8), 
            child: HorizontalTileWidget()))
        ]
      ) 
    );
  }
}

// class VerticalScrollTileHolderWidget extends StatelessWidget {
//   const VerticalScrollTileHolderWidget({super.key});

//   @override 
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       itemCount: 5,
//       shrinkWrap: true,
//       physics: const AlwaysScrollableScrollPhysics(),
//       separatorBuilder: (_, __) => const SizedBox(height: 8),
//       itemBuilder: (context, index) {
//         return const HorizontalTileWidget();
//     });
//   }
// }