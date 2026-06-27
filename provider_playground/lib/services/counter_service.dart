import 'package:provider_playground/services/i_counter_service.dart';

class CounterService implements ICounterService {
  int _counter = 0;

  @override
  void increment() {
    _counter++;
  }

  @override
  int getCount() {
    return _counter;
  }
}