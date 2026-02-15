import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'hadith_model.dart';
import 'hadith_repository.dart';

class HadithNotifier extends StateNotifier<HadithModel?> {

  HadithNotifier() : super(null);

  final repo = HadithRepository();

  Future<void> loadHadith() async {

    final hadith = await repo.getHadith();

    state = hadith;
  }
}
