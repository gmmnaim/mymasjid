import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:mymasjid/features/prayer/prayer_model.dart';
import 'prayer_notifier.dart';

final prayerProvider =
StateNotifierProvider.autoDispose<PrayerNotifier, PrayerModel?>((ref) {

  final notifier = PrayerNotifier();

  ref.onDispose(() {
    notifier.dispose();   /// 🔥 Timer Kill
  });

  return notifier;

});

