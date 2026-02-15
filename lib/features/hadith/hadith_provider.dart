import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'hadith_model.dart';
import 'hadith_notifier.dart';

final hadithProvider =
StateNotifierProvider<HadithNotifier,HadithModel?>((ref){

  final notifier = HadithNotifier();

  notifier.loadHadith();

  Timer.periodic(
      const Duration(minutes:20),
          (_)=> notifier.loadHadith()
  );

  return notifier;
});
