
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart';

class Song {
  final String title;
  final String path;

  Song({
    required this.title,
    required this.path
  });
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await requestStoragePermission();

  runApp(const MyApp());
}

Future<void> requestStoragePermission() async {
  PermissionStatus status = await Permission.audio.request();

  if (!status.isGranted) {
    openAppSettings();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final player = AudioPlayer();
  bool isLoading = true;

  Future<List<File>> scanMp3Songs() async {
    List<String> paths = [
      "/storage/emulated/0/Download"
    ];
    
    List<File> songs = [];

    for (var path in paths) {
      final Directory dir = Directory(path);

      await for (var file in dir.list(recursive: true)) {
          if (file is File && file.path.endsWith(".mp3")) {
            songs.add(file);
          }
      }
    }

    return songs;
  }

  List<Song> formatSongs(List<File> files) {
    return files.map((file) {
      return Song(
        path: file.path.replaceAll(RegExp(r"_mixed\.mp3$"), "").trim(),
        title: basename(file.path.replaceAll(RegExp(r"_mixed\.mp3$|.mp3"), ""))
      );
    }).toList();
  }

  Future<void> init() async {
    final List<File> files = await scanMp3Songs();
    List<Song> songs = formatSongs(files);

    final List<AudioSource> playlist = songs.map((song) => AudioSource.file(song.path)).toList();

    await player.setAudioSources(
      playlist,
      initialIndex: 0,
      initialPosition: Duration.zero,
      shuffleOrder: DefaultShuffleOrder()
    );
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  void play() async => await player.play();
  void pause() async => await player.pause();
  void toNext() async => await player.seekToNext();
  void toPrevious() async => await player.seekToPrevious();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Just Audio Demo"),),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: play, 
            child: Text("Play")
          ),
          ElevatedButton(
            onPressed: pause, 
            child: Text("Pause")
          ),
           ElevatedButton(
            onPressed: toPrevious, 
            child: Text("To Previous")
          ),
           ElevatedButton(
            onPressed: toNext, 
            child: Text("To Next")
          ),
          LoopModeButton(player: player),
          ShuffleModeButton(player: player),
          ElevatedButton(
            onPressed: () async {
              await requestStoragePermission();
            }, 
            child: Text("Ask Permission")
          ),
          StreamBuilder(
            stream: player.positionStream, 
            builder: (_, snapshot) {
              final currentPosition = snapshot.data ?? Duration.zero;
              final songDuration = player.duration ?? Duration.zero;

              return SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 2,
                  thumbShape:RoundSliderThumbShape(),
                  activeTrackColor: Colors.red,
                  inactiveTrackColor: Colors.pink,
                  thumbColor: Colors.black
                ), 
                child: Slider(
                  value: currentPosition.inSeconds.toDouble().clamp(0, songDuration.inSeconds.toDouble()),
                  min: 0,
                  max: songDuration.inSeconds.toDouble(),
                  onChanged: (value) {
                    player.seek(Duration(seconds: value.toInt()));
                  } ,
                )
              );
            }
          )
        ],
      )
    );
  }
}

class ShuffleModeButton extends StatefulWidget {
  final AudioPlayer player;

  const ShuffleModeButton({
    super.key,
    required this.player
  });

  @override
  State<ShuffleModeButton> createState() => _ShuffleModeButtonState();
}

class _ShuffleModeButtonState extends State<ShuffleModeButton> {
  bool isShuffle = false;

  void shuffle(bool isShuffle) async {
    setState(() {
      this.isShuffle = isShuffle;
    });

    await widget.player.setShuffleModeEnabled(isShuffle);
  }

  @override
  Widget build(BuildContext context) {
    if (isShuffle) {
      return ElevatedButton(
        onPressed: () => shuffle(false), 
        child: Icon(Icons.shuffle)
      );
    }

    return ElevatedButton(
      onPressed: () => shuffle(true), 
      child: Icon(Icons.shuffle, color: Colors.grey,)
    );
  }
}

class LoopModeButton extends StatefulWidget {
  final AudioPlayer player;

  const LoopModeButton({
    super.key,
    required this.player
  });

  @override
  State<LoopModeButton> createState() => _LoopModeButtonState();
}

class _LoopModeButtonState extends State<LoopModeButton> {
  LoopMode currentMode = LoopMode.off;

  void turnOffLoop() async {
    await widget.player.setLoopMode(LoopMode.off);
  }

   void turnOnLoopOne() async {
    await widget.player.setLoopMode(LoopMode.one);
  }

   void turnOnLoopAll() async {
    await widget.player.setLoopMode(LoopMode.all);
  }

  void toMode(LoopMode mode) {
    setState(() {
      currentMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (currentMode) {

      case LoopMode.off:
        turnOffLoop();
        return ElevatedButton(
          onPressed: () => toMode(LoopMode.one), 
          child: Icon(Icons.repeat, color: Colors.grey,)
        );
      
      case LoopMode.one:
        turnOnLoopOne();
        return ElevatedButton(
          onPressed: () => toMode(LoopMode.all), 
          child: Icon(Icons.repeat_one)
        );

      case LoopMode.all: 
        turnOnLoopAll();
        return ElevatedButton(
          onPressed: () => toMode(LoopMode.off), 
          child: Icon(Icons.repeat)
        );
    }
  }
}

String format(Duration duration) {
  final minutes = duration.inMinutes.remainder(60).toString().padLeft(2);
  final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, "0");
  
  return "$minutes:$seconds";
}