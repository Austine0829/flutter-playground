import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_playground/services/counter_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => CounterService()),
      ],
      child: MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late CounterService _counterService; 

  @override
  void initState() {
    super.initState();
    _counterService = context.read<CounterService>();
  }

  void increment() => 
    setState(() {
    _counterService.increment();     
  });


  @override
   Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Provider Example")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            increment();
          },
          child: Text("Increment ${_counterService.counter.toString()}"),
        ),
      ),
    );
  }
}