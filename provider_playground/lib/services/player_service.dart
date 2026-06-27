import 'package:flutter/material.dart';
import 'package:provider_playground/services/i_player_service.dart';

class PlayerService extends ChangeNotifier implements IPlayerService {
  final List<String> _songs = [
    "Song 1",
    "Song 2",
    "Song 3",
    "Song 4",
    "Song 5"
  ];

  @override
  List<String> get songs => _songs;

  @override
  void removeSongAt(int index) {
    _songs.removeAt(index);
    notifyListeners();
  } 
}