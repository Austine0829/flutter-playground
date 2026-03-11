import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart' as path;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await requestPermissions();

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const HomePage(),
    );
  }
}

Future<void> requestPermissions() async {
  await Permission.audio.request();
  await Permission.storage.request();
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class Song {
  final String path;
  final String title;

  Song({
    required this.path,
    required this.title,
  });
}

class _HomePageState extends State<HomePage> {

  List<Song> songs = [];
  bool isLoading = true;

  Future<List<File>> fastScanMp3() async {
    final List<String> folders = [
      "/storage/emulated/0/Music",
      "/storage/emulated/0/Download",
    ];

    List<File> songs = [];

    for (var path in folders) {
      final dir = Directory(path);
      
      if (!dir.existsSync()) continue;

      await for (var entity in dir.list(recursive: true)) {
        if (entity is File && entity.path.endsWith(".mp3")) {
          songs.add(entity);
        }
      }
    }

    return songs;
  }

  List<Song> convertSongs(List<File> files) {
    return files.map((file) {
      return Song(
        path: file.path.replaceAll(RegExp(r"_mixed\.mp3$"), ".mp3"),
        title: path.basename(file.path.replaceAll(RegExp(r'_mixed\.mp3$|.mp3'), ""))
      );
    }).toList();
  } 

  Future<void> init() async {
    var files = await fastScanMp3();
    setState(() {
     songs = convertSongs(files);
     isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    
    int index = 50;

    return Scaffold(
      body: !isLoading ? Center(child: Text("${songs[index].title} ${songs[index].path}"),) : Center(child: Text("Is Loading"),) 
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