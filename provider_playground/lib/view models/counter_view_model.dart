import 'package:flutter/material.dart';
import 'package:provider_playground/services/i_counter_service.dart';

class CounterViewModel extends ChangeNotifier {
  late final ICounterService _counterService;

  CounterViewModel({required ICounterService counterService}) {
    _counterService = counterService;
  }
  
  int get count => _counterService.getCount();

  void increment() {
    _counterService.increment();
    notifyListeners();
  }
}