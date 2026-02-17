import 'package:hive/hive.dart';
import 'hadith_model.dart';
import 'hadith_service.dart';

class HadithRepository {

  final service = HadithService();
  final box = Hive.box<HadithModel>('hadithBox');

  Future<HadithModel> getHadith() async {

    try {

      final list = await service.fetchHadithList();

      final hadithList = list
          .map((e) => HadithModel.fromJson(e))
          .toList();

      // hadithList.removeWhere(
      //       (h) => h.hadithEnglish.length >= 350,
      // );

      hadithList.shuffle();   /// 🔥 RANDOMIZE

      final filtered = hadithList.first;
      ;

      /// 🧨 DELETE OLD HADITH
      await box.clear();

      /// 🟢 SAVE NEW HADITH
      await box.put('latest', filtered);

      return filtered;

    } catch (e) {

      /// 🔴 OFFLINE MODE
      final offline = box.get('latest');

      if (offline != null) {
        return offline;
      } else {
        throw Exception("No Hadith Found in Hive");
      }
    }
  }

}
