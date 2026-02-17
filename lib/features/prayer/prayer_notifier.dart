import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:mymasjid/features/prayer/prayer_model.dart';
import 'package:mymasjid/features/prayer/prayer_repository.dart';

class PrayerNotifier extends StateNotifier<PrayerModel?> {

  PrayerNotifier() : super(null) {
    loadPrayer();       /// 🔵 App Start API Call
    startAutoUpdate();  /// 🔵 20 min loop
  }

  final repo = PrayerRepository();
  Timer? _timer;
  int _token = 0;

  Future<void> loadPrayer() async {

    print("🕌 Prayer API Called at: ${DateTime.now()}");

    try {

      final prayer = await repo.getPrayer();

      if (mounted) {
        state = prayer;
        print("🟢 Prayer Updated at: ${DateTime.now()}");
      }

    } catch (e) {

      final offline = repo.box.get('latest');

      if (offline != null && mounted) {
        state = offline;
        print("🔴 Prayer Offline Loaded");
      }
    }
  }

  void startAutoUpdate() {

    _timer?.cancel();   /// 🔥 prevent multi loop

    final currentToken = _token;

    _timer = Timer(const Duration(seconds:30), () async {

      if (currentToken != _token) return;

      await loadPrayer();
      startAutoUpdate();   /// 🔁 recursive safe
    });
  }


  @override
  void dispose() {
    _token++;        /// 🔥 cancel loop
    _timer?.cancel();
    super.dispose();
  }
}


