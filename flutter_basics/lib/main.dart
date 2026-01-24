import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Home", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.black,
        ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 17,
          right: 17
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Naruto Shippuden", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
            SizedBox(
            height: 200,
            child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder:(context, index) {
                return Container(
                width: 150,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.red
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage("assets/naruto.jpeg"),
                          fit: BoxFit.cover
                        ),
                      borderRadius: BorderRadius.circular(8) 
                      ),
                    ),
                  const Text("Anime", style: TextStyle(color: Colors.white54)),
                  const Text("Naruto", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))
                  ]
                )
              );
            }, 
            separatorBuilder: (_, __) => const SizedBox(width: 10), 
            itemCount: 5), 
            ) 
          ],
        ) 
      ) 
    );
  }
}

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override 
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: const Text("Home", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
//         backgroundColor: Colors.black,
//         ),
//       body: Padding(
//         padding: const EdgeInsets.only(
//           left: 17,
//           right: 17
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text("Naruto Shippuden", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
//             SizedBox(
//             height: 200,
//             child: ListView.separated(
//             scrollDirection: Axis.horizontal,
//             itemBuilder:(context, index) {
//                 return Container(
//                 width: 150,
//                 decoration: BoxDecoration(
//                   border: Border.all(width: 1),
//                   borderRadius: BorderRadius.circular(8),
//                   color: Colors.red
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       height: 150,
//                       decoration: BoxDecoration(
//                         image: const DecorationImage(
//                           image: AssetImage("assets/naruto.jpeg"),
//                           fit: BoxFit.cover
//                         ),
//                       borderRadius: BorderRadius.circular(8) 
//                       ),
//                     ),
//                   const Text("Anime", style: TextStyle(color: Colors.white54)),
//                   const Text("Naruto", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))
//                   ]
//                 )
//               );
//             }, 
//             separatorBuilder: (_, __) => const SizedBox(width: 10), 
//             itemCount: 5), 
//             ) 
//           ],
//         ) 
//       ) 
//     );
//   }
// }