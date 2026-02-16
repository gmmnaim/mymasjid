import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'hadith_model.dart';
import 'hadith_repository.dart';

class HadithNotifier extends StateNotifier<HadithModel?> {

  /// 🔵 App Start = Auto API Call
  /// 🔵 Every 10 min = Auto Retry
  HadithNotifier() : super(null){
    loadHadith();        /// 🔥 Device Start API Call
    startAutoUpdate();   /// 🔥 Every 10 min API Try
  }

  final repo = HadithRepository();
  Timer? _timer;

  Future<void> loadHadith() async {

    try{
      final hadith = await repo.getHadith();
      state = hadith;
    }catch(e){
      print("Hadith Offline Mode Active");
    }

  }

  void startAutoUpdate(){

    _timer?.cancel();

    _timer = Timer.periodic(
      const Duration(minutes:10),
          (_)=> loadHadith(),
    );

  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
