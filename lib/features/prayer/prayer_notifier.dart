import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:mymasjid/features/prayer/prayer_model.dart';
import 'package:mymasjid/features/prayer/prayer_repository.dart';

class PrayerNotifier extends StateNotifier<PrayerModel?> {

  PrayerNotifier():super(null){
    loadPrayer();         /// 🔵 DEVICE START
    startAutoUpdate();    /// 🔵 20 MIN AUTO
  }

  final repo = PrayerRepository();
  Timer? _timer;

  Future<void> loadPrayer() async {

    try{

      final prayer = await repo.getPrayer();
      state = prayer;

    }catch(e){
      print("Offline Mode Active");
    }

  }

  void startAutoUpdate(){

    _timer?.cancel();

    _timer = Timer.periodic(
      const Duration(minutes:20),
          (_)=> loadPrayer(),   /// 🔥 EVERY 20 MIN API TRY
    );

  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

}

