import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'hadith_model.dart';
import 'hadith_notifier.dart';

final hadithProvider =
StateNotifierProvider<HadithNotifier,HadithModel?>((ref){

  /// 🔵 App Start API Call
  /// 🔵 Every 10 min API Call
  /// 🔵 API Fail → Hive Load

  return HadithNotifier();
});

