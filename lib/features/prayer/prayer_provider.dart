import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:mymasjid/features/prayer/prayer_model.dart';
import 'prayer_notifier.dart';

final prayerProvider =
StateNotifierProvider<PrayerNotifier,PrayerModel?>((ref){

  final notifier = PrayerNotifier();

  /// 20 MIN AUTO CALL
  Timer.periodic(
      const Duration(minutes:20),
          (_)=> notifier.loadPrayer()
  );

  return notifier;
});
