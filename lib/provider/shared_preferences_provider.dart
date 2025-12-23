import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _counterKey = 'counter_value';

class CounterNotifier extends AsyncNotifier<int> {
  /// Called automatically the first time the provider is used.
  @override
  Future<int> build() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getInt(_counterKey) ?? 0;
    return saved;
  }

  /// Save a new counter value
  Future<void> save(int value) async {
    // 1️⃣ Put state in loading (optional but clean)
    state = const AsyncLoading();

    // 2️⃣ Persist to SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_counterKey, value);

    // 3️⃣ Update Riverpod state
    state = AsyncData(value);
  }

  /// Convenience: increment
  Future<void> increment() async {
    final current = state.value ?? 0;
    await save(current + 1);
  }

  /// Convenience: reset
  Future<void> reset() async {
    await save(0);
  }
}
