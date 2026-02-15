import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:mymasjid/features/prayer/prayer_model.dart';
import 'package:mymasjid/features/prayer/prayer_repository.dart';

class PrayerNotifier extends StateNotifier<PrayerModel?> {

  PrayerNotifier():super(null){

    loadPrayer(); /// APP START = AUTO CALL
  }

  final repo = PrayerRepository();

  Future<void> loadPrayer() async {

    final prayer = await repo.getPrayer();

    state = prayer;
  }
}
