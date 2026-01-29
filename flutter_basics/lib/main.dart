import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MessagePage(),
    );
  }
}

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Someone Clicked Me! WAAAAAAAAH!"))
            );
          }, 
          child: const Text("Click Me!")),
      ),
    );
  }
}

// class PersistentBottomNavigationBar extends StatefulWidget {
//   const PersistentBottomNavigationBar({super.key});

//   @override
//   State<PersistentBottomNavigationBar> createState() => _PersistentBottomNavigationBarState();
// }

// class _PersistentBottomNavigationBarState extends State<PersistentBottomNavigationBar> {
//   int _currentIndex = 0;

//   static const List<Widget> _pages = [
//     HomePage(),
//     Center(child: Text("Search"))
//   ] ;

//   @override 
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_currentIndex],
//       extendBody: true,
//       bottomNavigationBar: Container(
//         decoration: BoxDecoration(
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.7),
//               blurRadius: 30,
//               spreadRadius: 15
//             )
//           ]
//         ),
//         child: BottomNavigationBar(
//           backgroundColor: Colors.transparent,
//           elevation: 15,
//           currentIndex: _currentIndex,
//           selectedFontSize: 10,
//           unselectedFontSize: 10,
//           selectedItemColor: Colors.white,
//           unselectedItemColor: Colors.grey,
//           onTap: (index) {
//             setState(() {
//               _currentIndex = index;
//             });
//           },
//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               activeIcon: Icon(Icons.home),
//               label: "Home"
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.search),
//               label: "Search"
//             )
//           ]
//         ) 
//       ) 
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override 
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text(
//           "Home", 
//           style: TextStyle(
//               fontWeight: FontWeight.bold,
//               color: Colors.white
//             )
//           )
//         ),
//       body: Padding(
//         padding: const EdgeInsets.only(
//           left: 17,
//           right: 17,
//           top: 5
//         ),
//         child: SingleChildScrollView(child:
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("Anime Episodes", style: Theme.of(context).textTheme.sectionLabel),
//               const HorizontalScrollTileHolderWidget(),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                 Text("Recent Watch History", style: Theme.of(context).textTheme.sectionLabel),
//                 TextButton(
//                   onPressed: () {
//                      showModalBottomSheet(
//                       context: context,
//                       showDragHandle: true,
//                       builder: (context) {
//                         return const SwipableMenuSheetWidget();
//                       },
//                     );
//                   }, 
//                   child: const Text("Show All")
//                 )
//               ]),
//               const VerticalScrollTileHolderWidget(),
//               const HorizontalScrollTileHolderWidget(),
//           ]),
//         ) 
//       ),
//     );
//   }
// }