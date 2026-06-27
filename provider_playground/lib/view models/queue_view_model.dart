import 'package:flutter/material.dart';
import 'package:provider_playground/services/i_player_service.dart';

class QueueViewModel extends ChangeNotifier {
  final IPlayerService _playerService;

  List<String> get songs => _playerService.songs;

  QueueViewModel(IPlayerService playerService) : _playerService = playerService {
    _playerService.addListener(notifyListeners);
  }

  void removeSongAt(int index) {
    _playerService.removeSongAt(index);
  }
}