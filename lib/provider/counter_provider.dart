import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = NotifierProvider<CounterProvider, int>(
  () => CounterProvider(),
);

class CounterProvider extends Notifier<int> {
  @override
  int build() {
    return 90;
  }

  void increment() {
    state++;
  }

  void reset() {
    state = 0;
  }
}
