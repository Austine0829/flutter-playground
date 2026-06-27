import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_playground/services/counter_service.dart';
import 'package:provider_playground/services/i_player_service.dart';
import 'package:provider_playground/services/player_service.dart';
import 'package:provider_playground/view%20models/counter_view_model.dart';
import 'package:provider_playground/view%20models/player_view_model.dart';
import 'package:provider_playground/view%20models/queue_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => CounterService()),
        ChangeNotifierProvider(create: (_) => PlayerService()),
        ChangeNotifierProvider(create: (context) => CounterViewModel(counterService: context.read<CounterService>())),
        // ChangeNotifierProxyProvider<PlayerService, PlayerViewModel>(
        //   create: (context) => PlayerViewModel(context.read<PlayerService>()), 
        //   update: (context, playerService, viewModel) => viewModel ?? PlayerViewModel(playerService)
        // ),
        // ChangeNotifierProxyProvider<PlayerService, QueueViewModel>(
        //   create: (context) => QueueViewModel(context.read<PlayerService>()), 
        //   update: (context, playerService, viewModel) => viewModel ?? QueueViewModel(playerService)
        // )
        ChangeNotifierProvider(create: (context) => PlayerViewModel(context.read<PlayerService>())),
        ChangeNotifierProvider(create: (context) => QueueViewModel(context.read<PlayerService>()))
      ],  
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Nav Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}
 
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
 
  @override
  State<MainScreen> createState() => _MainScreenState();
}
 
class _MainScreenState extends State<MainScreen> {
  // Tracks which tab is currently selected
  int _selectedIndex = 0;
 
  // The pages are kept alive in the stack — only the selected one is visible
  final List<Widget> _pages = const [
    Page1(),
    Page2(),
  ];
 
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // IndexedStack keeps all pages mounted but only shows the selected one.
      // This preserves scroll position and state when switching tabs.
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_one_outlined),
            activeIcon: Icon(Icons.looks_one),
            label: 'Page 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_two_outlined),
            activeIcon: Icon(Icons.looks_two),
            label: 'Page 2',
          ),
        ],
      ),
    );
  }
}
 
// ── Page 1 ────────────────────────────────────────────────────────────────────
 
class Page1 extends StatelessWidget {
  const Page1({super.key});
 
  @override
  Widget build(BuildContext context) {
    final IPlayerService playerService = context.watch<PlayerService>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Player'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              playerService.songs.length, 
              (index) {
              return Text(playerService.songs[index]);
            })
          ],
        ),
      ),
    );
  }
}
 
// ── Page 2 ────────────────────────────────────────────────────────────────────
 
class Page2 extends StatelessWidget {
  const Page2({super.key});
 
  @override
  Widget build(BuildContext context) {
    final IPlayerService playerService = context.watch<PlayerService>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Queue'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              playerService.songs.length, 
              (index) {
                return ListTile(
                  onTap: () => playerService.removeSongAt(index),
                  title: Text(playerService.songs[index]),
                  tileColor: Colors.orange,
                );
              }
            )
          ],
        ),
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//    Widget build(BuildContext context) {
//     final CounterViewModel counterViewModel = context.watch<CounterViewModel>();

//     return Scaffold(
//       appBar: AppBar(title: Text("Provider Example")),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             counterViewModel.increment();
//           },
//           child: Text("Increment ${counterViewModel.count}"),
//         ),
//       ),
//     );
//   }
// }