import 'package:flutter/material.dart';
import 'pages/insert_page.dart';
import 'pages/read_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int _currentPageIndex = 0;

  final List<Widget> _pages = [
    InsertPage(),
    ReadPage(),
  ];

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SQLite"),),
      body: _pages[_currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.add), label: "Insert"),
        BottomNavigationBarItem(icon: Icon(Icons.read_more), label: "Read"),
      ]),
    );
  }  
}

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List<User> users = [];

//   @override
//   void initState() {
//     super.initState();
//     loadUsers();
//   }

//   Future<void> loadUsers() async {
//     final data = await DatabaseHelper.instance.getUsers();
//     setState(() {
//       users = data.map((e) => User.fromMapToObject(e)).toList();
//     });
//   }

//   Future<void> addUser() async {
//     await DatabaseHelper.instance.insertUser(
//       User(email: "hello@world.web", password: "admin123").fromObjectToMap(),
//     );
//     loadUsers();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('SQLite Demo')),
//       floatingActionButton: FloatingActionButton(
//         onPressed: addUser,
//         child: const Icon(Icons.add),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             for (var user in users) 
//               Text("Email: ${user.email} \nPassword: ${user.password}")
//           ],
//         ),
//       )
//     );
//   }
// }