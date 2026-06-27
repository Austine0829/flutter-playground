import 'package:flutter/material.dart';

abstract class IPlayerService extends ChangeNotifier {
  List<String> get songs;

  void removeSongAt(int index);
}